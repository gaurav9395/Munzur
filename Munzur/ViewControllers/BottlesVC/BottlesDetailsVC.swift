//
//  BottlesDetailsVC.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 24/09/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit

class BottlesDetailsVC: UIViewController {

    @IBOutlet weak var imgViewBottle: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCapacity: UILabel!
    @IBOutlet weak var lblInfo: UILabel!
    
    var bottle: Bottle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = bottle.name
        lblCapacity.text = "\(bottle.capacity) Liters"
        lblInfo.text = bottle.info.removingPercentEncoding
        imgViewBottle.sd_setImage(with: URL(string: bottle.imgurl),
                                   placeholderImage: UIImage(named: "logo"))
    }
}
