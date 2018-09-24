//
//  AdvertCVC.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 24/09/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit

class AdvertCVC: UICollectionViewCell {
    @IBOutlet weak var clctionView: UICollectionView!
    
    private let aderts = [#imageLiteral(resourceName: "dummy1"), #imageLiteral(resourceName: "dummy2"), #imageLiteral(resourceName: "dummy3")]
    
    override func awakeFromNib() {
        clctionView.register(cells: ImageViewCVC.self)
        clctionView.dataSource = self
        clctionView.delegate = self
        clctionView.round(radius: 8, corners: .all)
        clctionView.reloadData()
    }
    
}

extension AdvertCVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return aderts.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ImageViewCVC.dequeReusablyFor(collectionView, at: indexPath)
        cell.image = aderts[indexPath.item]
        return cell
    }
}

extension AdvertCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}

