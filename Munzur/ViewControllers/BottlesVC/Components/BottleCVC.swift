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

    @IBOutlet weak var viewLower: UIView!
    weak var delegate: BottleCVCDelegate?
    
    var index: Int = 0 {
        willSet{}
    }
    
    override func awakeFromNib() {
        viewLower.round(radius: 8, corners: .bottomLeft, .bottomRight)
    }
    
    // MARK : - Button actions
    @IBAction func actionSeeDetails() {
        delegate?.seeDetailsTapped(at: index)
    }
}
