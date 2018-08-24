import UIKit

extension UINavigationController {
    
    /**
    A method to move back to a view controller in the navigation stack, iff it exists.
     - parameter controller: Class Type of the view controller you wish to move back to
    */
    func popToView(controller: UIViewController.Type) {
        for viewController in viewControllers {
            if viewController.isKind(of: controller) {
                popToViewController(viewController, animated: true)
            }
        }
    }
    
    /**
     A method to check if a view controller is present in the navigation stack.
     - parameter controller: Class Type of the view controller
     */
    func containsView(controller:  UIViewController.Type) -> Bool {
        for viewController in viewControllers {
            if viewController.isKind(of: controller) {
                return true
            }
        }
        return false
    }
}
