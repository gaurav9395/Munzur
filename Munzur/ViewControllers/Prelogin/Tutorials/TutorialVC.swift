//
//  TutorialVC.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 24/09/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit

class TutorialVC: UIViewController {

    @IBOutlet weak var clctionViewTutorial: UICollectionView!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
    }
}

// MARK : - Collectionview datasource
extension TutorialVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ImageViewCVC.dequeReusablyFor(collectionView, at: indexPath)
        return cell
    }
}
