//
//  BottleCVC.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 24/09/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit

class BottleCVC: UICollectionViewCell {

    @IBOutlet weak var viewLower: UIView!
    
    override func awakeFromNib() {
        viewLower.round(radius: 8, corners: .bottomLeft, .bottomRight)
    }
    
}
