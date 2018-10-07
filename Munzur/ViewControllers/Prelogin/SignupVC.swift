//
//  SignupVC.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 24/09/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet weak var txtFldName: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldNumber: UITextField!
    @IBOutlet weak var txtFldCountry: UITextField!
    @IBOutlet weak var txtFldPass: UITextField!
    @IBOutlet weak var txtViewAddress: UITextView!
    
    private let validator = Validator()
    
    // MARK : - Button action
    @IBAction private func actionSignup() {
        validateAndProceed()
    }
    
    private func validateAndProceed() {
        if txtFldName.isBlank {
            showAlertControllerWith(message: .nameRequired, buttons: .ok(nil))
        } else if !validator.isValid(email: txtFldEmail.trimmedText) {
            showAlertControllerWith(message: .emailInvalid, buttons: .ok(nil))
        } else if txtFldNumber.isBlank {
            showAlertControllerWith(message: .phoneRequired, buttons: .ok(nil))
        } else if txtFldPass.isBlank {
            showAlertControllerWith(message: .passEmpty, buttons: .ok(nil))
        } else if txtFldCountry.isBlank {
            showAlertControllerWith(message: .countryRequired, buttons: .ok(nil))
        } else if txtViewAddress.text!.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            showAlertControllerWith(message: .addressRequired, buttons: .ok(nil))
        } else {
            prepareParamsAndProceed()
        }
    }
    
    private func prepareParamsAndProceed() {
        let params = [
            "uname": txtFldName.trimmedText,
            "pwd": txtFldPass.trimmedText,
            "email": txtFldEmail.trimmedText,
            "country": txtFldCountry.trimmedText,
            "contactno": txtFldNumber.trimmedText,
            "address": txtViewAddress.text!.trimmingCharacters(in: .whitespacesAndNewlines),
            "modelName": "iPhone",
            "deviceid": "uuid",
            "devicetype": "ios"
        ]
        signupUser(with: params)
    }
    
    private func signupUser(with params: [String: Any]) {
        WebService.shared.requestFor(api: .signup(params)) { (status, code, data, message) in
            if status {
                self.navigationController?.popViewController(animated: true)
            } else {
                self.showAlertControllerWith(message: .custom(message), buttons: .ok(nil))
            }
        }
    }
}
