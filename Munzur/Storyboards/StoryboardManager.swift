//
//  StoryboardManager.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 8/20/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit

enum Storyboard : String {
    case main, prelogin
    
    var instance : UIStoryboard {
        return UIStoryboard(name: rawValue.capitalized, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(_ controller: T.Type) -> T {
        let storyId = (controller as UIViewController.Type).storyboardId
        return instance.instantiateViewController(withIdentifier: storyId) as! T
    }
}

extension UIViewController {
    class var storyboardId: String {
        return "\(self)"
    }
    
    /**
     This is a method to instatiate a view controller from a storyboard.
     - parameter storyboard: An object of type Storyboards that contains the desired view controller
     * the only rule here is that you should keep the storyboardId in the storyboard similar to the name of the viewController, if not then provide your storyboardId before instantiating your viewController.
     * It can be used as --->
     * let homeScene = HomeVC.instantiateFrom(storyboard: .main)
     */
    static func instantiateFrom(storyboard: Storyboard) -> Self {
        return storyboard.viewController(self)
    }
}
