//
//  Profile.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 09/10/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import Foundation

final class Profile {
    var country = String()
    var contact = String()
    var email = String()
    var address = String()
    var username = String()
    var id = Int()

    init(_ data: NSDictionary) {
        username = data["name"] as? String ?? ""
        country = data["country"] as? String ?? ""
        contact = data["contactno"] as? String ?? ""
        email = data["email"] as? String ?? ""
        address = data["address"] as? String ?? ""
        id = data["ID"] as? Int ?? 0
    }
}

