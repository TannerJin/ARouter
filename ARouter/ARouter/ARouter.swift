//
//  ARouter.swift
//  ARouter
//
//  Created by jintao on 2020/5/27.
//  Copyright © 2020 jintao. All rights reserved.
//

import Foundation

public typealias ForwordingInvocationBlock = @convention(block) (AnyObject)->Unmanaged<AnyObject>?

public class ARouter: NSObject {
    fileprivate var forwordingInvocations = [Selector: ForwordingInvocationBlock]()
    fileprivate var defaultNotFoundHander: ForwordingInvocationBlock?
    
    public static let `default`: AnyObject = ARouter()
    public static let shared: ARouter = ARouter.default as! ARouter
    
    private override init() {}
    
    // TODO: 优化这种使用方式
    public func performTarget(_ className: String) -> AnyObject? {
        if let objcClass = NSClassFromString(className) as? NSObject.Type {
            return objcClass.init()
        }
        assert(false, "\(className) is not class or subClass of NSObject")
        return nil
    }
}

public extension ARouter {
    func setDefaultHandleNotFound(_ hander: @escaping ForwordingInvocationBlock) {
        defaultNotFoundHander = hander
    }
    
    @discardableResult
    @objc func setHandleNotFound(for aSelector: Selector, _ handler: ForwordingInvocationBlock?) -> AnyObject {
        forwordingInvocations[aSelector] = handler
        
        if class_getInstanceMethod(ARouterForwarding.self, aSelector) != nil {
            var block: ForwordingInvocationBlock
            if let _block = handler {
                block = _block
            } else if let _block = defaultNotFoundHander {
                block = _block
            } else {
                block = { objc in
                    print("[ARouter]: SEL(\(NSStringFromSelector(aSelector))) had been forwardingTarget to \(type(of: objc))")
                    return nil
                }
            }
            let imp = imp_implementationWithBlock(block)
            class_replaceMethod(ARouterForwarding.self, aSelector, imp, nil)
        }
        return self as AnyObject
    }
}

public extension ARouter {
    override class func resolveInstanceMethod(_ sel: Selector!) -> Bool {
        print("[ARouter]: SEL(\(NSStringFromSelector(sel))) Not Found")
        return super.resolveInstanceMethod(sel)
    }
    
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        if class_getInstanceMethod(ARouterForwarding.self, aSelector) == nil {
            var block: ForwordingInvocationBlock
            if let _block = forwordingInvocations[aSelector] {
                block = _block
            } else if let _block = defaultNotFoundHander {
                block = _block
            } else {
                block = { objc in
                    print("[ARouter]: SEL(\(NSStringFromSelector(aSelector))) had been forwardingTarget to \(type(of: objc))")
                    return nil
                }
            }
            let imp = imp_implementationWithBlock(block)
            class_addMethod(ARouterForwarding.self, aSelector, imp, nil)
        }
        return ARouterForwarding()
    }
}
