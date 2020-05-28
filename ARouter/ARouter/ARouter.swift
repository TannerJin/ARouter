//
//  ARouter.swift
//  ARouter
//
//  Created by jintao on 2020/5/27.
//  Copyright © 2020 jintao. All rights reserved.
//

import Foundation

public class ARouter: NSObject {
    /*
        缓存策略: RunTime中CacheTable已经做了
     */
    public static let `default`: AnyObject = ARouter()
    
    /*
        在函数调用时加上"?"，可以避免RunTime机制的的闪退
        TODO: 总会有人不小心去掉"?"，然后又没有实现SEL... Swift中该如何避免闪退呢?
     */
    public override class func resolveInstanceMethod(_ sel: Selector!) -> Bool {
        print("[ARouter]: SEL(\(NSStringFromSelector(sel))) Not Found")
        return super.resolveInstanceMethod(sel)
    }
}
