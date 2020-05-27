# ARouter
Swift Router

Inspired from [CTMediator](https://github.com/casatwy/CTMediator) and Based On `RunTime of AnyObject`

Usage

```swift
/* At Login Moudle
*/

extension ARouter {
    @objc func enterLogin(navi: UINavigationController) {
        let loginController = LoginViewController(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
        navi.pushViewController(loginController, animated: true)
    }
    
    @objc func isLoginSuccess(param1: [String: Any], param2: Int) -> Bool {
        ...
        return true
    }
 }   


/* At Any Moudle (don't need import LoginMoudle)
*/

ARouter.default.enterLogin?(navi: navigationController)

if let result = ARouter.default.isLoginSuccess?(param1: [:], param2: 996), result == true {
    print("Login Success")
}
```