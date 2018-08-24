import UIKit

extension UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }
    
    private static func cellFor<T: UICollectionViewCell>(collection: UICollectionView, at index: IndexPath) -> T {
        let identifier = (self as UICollectionViewCell.Type).identifier
        return collection.dequeueReusableCell(withReuseIdentifier: identifier, for: index) as! T
    }
    
    static func dequeReusablyFor(_ collectionView: UICollectionView, at index: IndexPath) -> Self {
        return cellFor(collection: collectionView, at: index)
    }
}

extension UICollectionView {
    func register(cells: UICollectionViewCell.Type...) {
        for cell in cells {
            self.register(UINib(nibName: cell.identifier, bundle: nil), forCellWithReuseIdentifier: cell.identifier)
        }
    }
}
