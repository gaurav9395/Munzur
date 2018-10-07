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
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var cnstBottomButton: NSLayoutConstraint!
    
}

// MARK : - Collectionview datasource
extension TutorialVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = TutorialCVC.dequeReusablyFor(collectionView, at: indexPath)
        cell.image = UIImage(named: "Slide\(indexPath.item + 1)")
        return cell
    }
}

// MARK : - Collectionview delegate
extension TutorialVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.item
        cnstBottomButton.constant = (indexPath.item == 2) ? 0 : -100
        UIView.animate(withDuration: 0.5) {
            self.view.layoutSubviews()
            self.view.layoutIfNeeded()
        }
    }
}
