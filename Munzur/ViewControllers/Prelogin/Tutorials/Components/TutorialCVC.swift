//
//  TutorialCVC.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 06/10/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit

class TutorialCVC: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    var image: UIImage? {
        willSet {
            imgView.image = newValue
        }
    }
}
