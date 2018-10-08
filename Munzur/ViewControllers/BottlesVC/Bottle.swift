//
//  Bottle.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 07/10/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import Foundation

struct Bottle {
    var capacity = Double()
    var imgurl = String()
    var info = String()
    var price = Double()
    var name = String()
    var infoAdded = String()
    var itemid = Int()
    private var imagePath = String()
    
    init(_ data: NSDictionary) {
        capacity = data["capacity"] as? Double ?? 0
        imagePath = data["imgurl"] as? String ?? ""
        info = data["info"] as? String ?? ""
        price = data["price"] as? Double ?? 0
        name = data["name"] as? String ?? ""
        infoAdded = data["infoAdded"] as? String ?? ""
        itemid = data["itemid"] as? Int ?? 0
        imgurl = "\(Endpoints.base.url)getImage?path=\(imagePath)"
        print(imgurl)
    }
}

extension Bottle {
    static func available(completion: @escaping ([Bottle])->()) {
        WebService.shared.requestFor(api: .bottles) { (status, code, data, message) in
            if status {
                if let arrayBottles = data["result"] as? [NSDictionary] {
                    completion(arrayBottles.map { Bottle($0) })
                }
            } else {
                AppDelegate.shared.window?.currentViewController()?
                    .showAlertControllerWith(message: .custom(message), buttons: .ok(nil))
            }
        }
    }
}
