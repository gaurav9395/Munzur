//
//  HistoryVC.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 8/22/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController {

    @IBOutlet weak var clctionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension HistoryVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HistoryCVC.dequeReusablyFor(collectionView, at: indexPath)
        return cell
    }
}

extension HistoryVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width - 16, height: 170)
    }
}
