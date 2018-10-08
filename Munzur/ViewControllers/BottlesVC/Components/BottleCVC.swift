//
//  BottleCVC.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 24/09/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit

protocol BottleCVCDelegate: class {
    func seeDetailsTapped(at index: Int)
}

class BottleCVC: UICollectionViewCell {

    @IBOutlet weak var imgViewBottle: UIImageView!
    @IBOutlet weak var viewLower: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblInfo: UILabel!

    
    weak var delegate: BottleCVCDelegate?
    
    var data: (index: Int, bottle: Bottle)! {
        willSet{
            imgViewBottle.sd_setImage(with: URL(string: newValue.bottle.imgurl),
                                       placeholderImage: UIImage(named: "logo"))
            lblInfo.text = newValue.bottle.info.removingPercentEncoding
            lblName.text = newValue.bottle.name
        }
    }
    
    override func awakeFromNib() {
        viewLower.round(radius: 8, corners: .bottomLeft, .bottomRight)
    }
    
    // MARK : - Button actions
    @IBAction func actionSeeDetails() {
        delegate?.seeDetailsTapped(at: data.index)
    }
}
