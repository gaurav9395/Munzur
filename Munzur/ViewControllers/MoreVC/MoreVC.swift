//
//  MoreVC.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 8/22/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit

class MoreVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionServiceableArea() {
    }
    
    @IBAction func actionLogout() {
        showAlertControllerWith(message: .sureLogout,
                                buttons: .cancel(nil),
                                .ok { AppDelegate.shared.sessionExpired() })
    }
}
