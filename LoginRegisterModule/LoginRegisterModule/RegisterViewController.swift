//
//  RegisterViewController.swift
//  LoginRegisterModule
//
//  Created by jintao on 2020/5/27.
//  Copyright © 2020 jintao. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Register"
        self.view.backgroundColor = .red
    }
}

extension RegisterViewController {
    @objc class func enterRegister(controller: UIViewController) {
        let navi = UINavigationController(rootViewController: RegisterViewController())
        controller.present(navi, animated: true, completion: nil)
    }
}
