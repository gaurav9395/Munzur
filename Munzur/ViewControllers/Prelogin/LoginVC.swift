//
//  ViewController.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 8/20/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var txtFldNumber: UITextField!
    @IBOutlet weak var txtFldPass: UITextField!

    @IBAction func actionLogin() {
        validateAndProceed()
    }
    
    private func validateAndProceed() {
        if txtFldNumber.isBlank {
            showAlertControllerWith(message: .phoneRequired, buttons: .ok(nil))
        } else if txtFldPass.isBlank {
            showAlertControllerWith(message: .passEmpty, buttons: .ok(nil))
        } else {
            prepareParamsAndProceed()
        }
    }
    
    private func prepareParamsAndProceed() {
        let params = [
            "pwd": txtFldPass.trimmedText,
            "contactno": txtFldNumber.trimmedText,
            "modelName": "iPhone",
            "deviceid": "uuid",
            "devicetype": "ios"
        ]
        signupUser(with: params)
    }
    
    private func signupUser(with params: [String: Any]) {
        WebService.shared.requestFor(api: .signin(params)) { (status, code, data, message) in
            if status {
                    UserDefaultsManager.userId = data["ID"] as? Int
                AppDelegate.shared.redirectToHome()
            } else {
                self.showAlertControllerWith(message: .custom(message), buttons: .ok(nil))
            }
        }
    }
}

