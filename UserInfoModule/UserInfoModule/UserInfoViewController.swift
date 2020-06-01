//
//  UserInfoViewController.swift
//  UserInfoModule
//
//  Created by jintao on 2020/5/27.
//  Copyright © 2020 jintao. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

extension UserInfoViewController {
    @objc class func enterUserInfo(withUserName userName: String) -> UIViewController {
        let userController = UserInfoViewController()
        userController.title = userName
        return userController
    }
}
