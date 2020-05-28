//
//  ARouter.swift
//  ARouter
//
//  Created by jintao on 2020/5/27.
//  Copyright © 2020 jintao. All rights reserved.
//

import Foundation

public class ARouter: NSObject {
    public static let `default`: AnyObject = ARouter()
    
    public override class func resolveInstanceMethod(_ sel: Selector!) -> Bool {
        print("[ARouter]: SEL(\(NSStringFromSelector(sel))) Not Found")
        return super.resolveInstanceMethod(sel)
    }
    
    public override func forwardingTarget(for aSelector: Selector!) -> Any? {
        if class_getInstanceMethod(ARouterForwarding.self, aSelector) == nil {
            let block: @convention(block) (AnyObject)->AnyObject? = { (objc) in
                print("[ARouter]: SEL(\(NSStringFromSelector(aSelector))) had been forwardingTarget to \(type(of: objc))")
                return nil
            }
            let imp = imp_implementationWithBlock(block)
            class_addMethod(ARouterForwarding.self, aSelector, imp, nil)
        }
        return ARouterForwarding()
    }
}

private class ARouterForwarding {}
