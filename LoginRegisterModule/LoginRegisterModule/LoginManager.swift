//
//  LoginManager.swift
//  LoginRegisterModule
//
//  Created by jintao on 2020/6/1.
//  Copyright © 2020 jintao. All rights reserved.
//

import Foundation

class LoginManager {
    @objc class func isLoginSuccess(param1: Int, param2: [String: Any]?) -> Bool {
        return param1 > 1024
    }
}
