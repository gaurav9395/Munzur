//
//  ProfileVC.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 24/09/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblNumber: UILabel!

    private var profile: Profile!
    
    override func viewDidLoad() {
        view.addGradientWith(colors: .blue, .white, direction: .vertical)
        fetchProfile()
        super.viewDidLoad()
    }
    
    private func fetchProfile() {
        guard let id = UserDefaultsManager.userId else { return }
        WebService.shared.requestFor(api: .profile(userId: id)) { (status, code, data, message) in
            if status {
                if let profileDic = (data["result"] as? [NSDictionary])?.first {
                    self.profile = Profile(profileDic)
                    self.populateProfile()
                }
            } else {
                self.showAlertControllerWith(message: .custom(message), buttons: .ok(nil))
            }
        }
    }
    
    private func populateProfile() {
        lblEmail.text = profile.email
        lblUserName.text = profile.username
        lblNumber.text = profile.contact
    }
}
