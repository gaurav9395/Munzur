//
//  AppDelegateNavigations.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 8/20/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit

extension AppDelegate {
    func handleInitialNavigation() {
        if UserDefaultsManager.userId != nil {
            redirectToHome()
        } else {
            redirectToTutorial()
        }
    }
    
    func redirectToHome() {
        let dashboardVC = Storyboard.main.instance.instantiateInitialViewController()!
        setRootView(controller: dashboardVC)
    }
    
    private func redirectToLogin() {
        let loginVC = LoginVC.instantiateFrom(storyboard: .prelogin)
        let navigation = UINavigationController(rootViewController: loginVC)
        navigation.isNavigationBarHidden = true
        setRootView(controller: navigation)
    }
    
    private func redirectToTutorial() {
        let loginVC = Storyboard.prelogin.instance.instantiateInitialViewController()!
        setRootView(controller: loginVC)
    }
    
    func sessionExpired() {
        UserDefaultsManager.userId = nil
        redirectToLogin()
    }
    
    private func setRootView(controller: UIViewController) {
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
