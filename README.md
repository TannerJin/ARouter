# ARouter

> Swift Router
>
> Inspired from [CTMediator](https://github.com/casatwy/CTMediator)    


Different with [SRouter](https://github.com/TannerJin/SRouter), It's Based On `RunTime of AnyObject`

## Usage

```swift
/* At LoginRegister Module
*/
class LoginViewController: UIViewController {
     @objc class func enterLogin(navi: UINavigationController, param1: Int, param2: String) -> LoginViewController {
         let loginController = LoginViewController(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
         loginController.title = param2 + "\(param1)"
         navi.pushViewController(loginController, animated: true)
         return loginController
     }
}   


/* At Any Moudle (don't need import LoginRegister Module)
*/
@objc protocol AnyMoudleUsedRouteTable {
    @objc func enterLogin(navi: UINavigationController, param1: Int, param2: String) -> UIViewController
}

_ = ARouter.shared.performTarget("LoginRegisterModule.LoginViewController")?.enterLogin(navi: navigationController, param1: 1024, param2: "Hello")
```

#### note

由于 @objc 限制，参数默认不支持struct类型。但支持swift标准库的struct数据类型，这是由于他们实现了[`_ObjectiveCBridgeable`协议](https://github.com/TannerJin/SwiftTips/blob/master/AS/AS/main.swift#L50)   
