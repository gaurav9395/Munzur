//
//  AppDelegate.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 8/20/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import SDWebImage

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static let shared = UIApplication.shared.delegate as! AppDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        appConfigurations()
        handleInitialNavigation()
        return true
    }
    
    private func appConfigurations() {
        window = UIWindow(frame: UIScreen.main.bounds)
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
//        GMSPlacesClient.provideAPIKey(Constants.googleKey)
//        GMSServices.provideAPIKey(Constants.googleKey)
        setupStatusBar()
    }
    
    private func setupStatusBar() {
        //        UIApplication.shared.statusBarView?.backgroundColor = Constants.appColor
        //        UIApplication.shared.statusBarStyle = .lightContent
    }
}

