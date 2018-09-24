//
//  ImageViewCVC.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 24/09/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit

class ImageViewCVC: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    var image: UIImage! {
        willSet {
            imgView.image = newValue
        }
    }
    
}
