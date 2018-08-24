//
//  AppDelegateNavigations.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 8/20/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit

extension AppDelegate {
    func redirectToHome() {
        let dashboardVC = Storyboard.main.instance.instantiateInitialViewController()!
        setRootView(controller: dashboardVC)
    }
    
    func redirectToLogin() {
        let loginVC = Storyboard.prelogin.instance.instantiateInitialViewController()!
        setRootView(controller: loginVC)
    }
    
    private func setRootView(controller: UIViewController) {
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
