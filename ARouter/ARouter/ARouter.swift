//
//  ARouter.swift
//  ARouter
//
//  Created by jintao on 2020/5/27.
//  Copyright © 2020 jintao. All rights reserved.
//

import Foundation

public typealias ForwordingInvocationBlock = @convention(block) (AnyClass)->Unmanaged<AnyObject>?

public class ARouter: NSObject {
    private var defaultNotFoundHander: ForwordingInvocationBlock?
    
    public static let `default` = ARouter()
    
    private override init() {}
    
    /*  1. className: class为NSObject子类才能进行消息转发
        2. handleNotFound: 默认设置为true
        如果设置为false, 并且外部不是可选调用. 就会进入`className`的消息转发流程(未处理会crash)
     */
    public func performTarget(_ className: String, handleNotFound: Bool = true) -> AnyObject? {
        guard let anyClass = NSClassFromString(className) else {
            print("[ARouter]: Not Found Class -> \(className)")
            return nil
        }
        
        if handleNotFound, anyClass is NSObject.Type {
           replaceForwardingTargetMethod(for: className)
        }
        return anyClass
    }
    
    private func replaceForwardingTargetMethod(for className: String) {
        guard let anyClass = NSClassFromString(className) else { return }
                
        let block: @convention(block) (AnyClass, Selector)->AnyObject? = { metaClass, notRecognizeSelector in
            print("[ARouter]: SEL(\(notRecognizeSelector)) of MetaClass(\(metaClass)) not found")
            let subInvocationsClassName = "ARouter." + className + ".Forwarding"
            let invocationsClass = self.lazyCreateSubInvocationsClass(subInvocationsClassName, superclass: anyClass)
            if class_getClassMethod(invocationsClass as? AnyClass, notRecognizeSelector) == nil, let subMetaClass = objc_getMetaClass(subInvocationsClassName) as? AnyClass {
                self.addMethodForMetaClass(subMetaClass, aSelector: notRecognizeSelector, handler: nil)
            }
            return invocationsClass as AnyObject
        }
        let imp = imp_implementationWithBlock(block)
        
        if let metaClass = objc_getMetaClass(className) as? AnyClass {
            class_replaceMethod(metaClass, #selector(metaClass.forwardingTarget(for:)), imp, nil)
        }
    }
    
    @discardableResult
    private func lazyCreateSubInvocationsClass(_ subInvocationsClassName: String, superclass: AnyClass) -> AnyObject {
        var invocationsClass: AnyObject
        
        if let subInvocationsClass = NSClassFromString(subInvocationsClassName) {
            invocationsClass = subInvocationsClass
        } else {
            invocationsClass = objc_allocateClassPair(superclass, subInvocationsClassName, 0) as AnyObject
            objc_registerClassPair(invocationsClass as! AnyClass)
        }
        
        return invocationsClass
    }
}

// MARK: 404
public extension ARouter {
    func setDefaultHandleNotFound(_ hander: @escaping ForwordingInvocationBlock) {
        defaultNotFoundHander = hander
    }
    
    func setNotFoundHandler(className: String, with aSelector: Selector, _ handler: ForwordingInvocationBlock?) {
        guard let anyClass = NSClassFromString(className) else {
            print("[ARouter]: Not Found Class -> \(className)")
            return
        }
        
        let subInvocationsClassName = "ARouter." + className + ".Forwarding"
        lazyCreateSubInvocationsClass(subInvocationsClassName, superclass: anyClass)
        if let metaClass = objc_getMetaClass(subInvocationsClassName) as? AnyClass {
            addMethodForMetaClass(metaClass, aSelector: aSelector, handler: handler)
        }
    }
    
    private func addMethodForMetaClass(_ metaClass: AnyClass, aSelector: Selector, handler: ForwordingInvocationBlock?) {
        var block: ForwordingInvocationBlock
        if let _block = handler {
            block = _block
        } else if let _block = defaultNotFoundHander {
            block = _block
        } else {
            block = { _metaClass in
                print("[ARouter]: SEL(\(aSelector)) of MetaClass(\(_metaClass)) has been Invocation")
                return nil
            }
        }
        let imp = imp_implementationWithBlock(block)
        
        if class_getClassMethod(metaClass, aSelector) != nil {
            class_replaceMethod(metaClass, aSelector, imp, nil)
        } else {
            class_addMethod(metaClass, aSelector, imp, nil)
        }
    }
}
