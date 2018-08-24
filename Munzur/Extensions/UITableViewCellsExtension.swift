import UIKit

//MARK:- Collection/TableView cells
extension UITableViewCell {
    static var identifier: String {
        return "\(self)"
    }
    
    private static func cellFor<T: UITableViewCell>(table: UITableView, _ indexPath: IndexPath) -> T {
        let identifier = (self as UITableViewCell.Type).identifier
        return table.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }
    
    static func dequeReusablyFor(_ tableView: UITableView, _ indexPath: IndexPath) -> Self {
        return cellFor(table: tableView, indexPath)
    }
}

extension UITableView {
    func register(cells: UITableViewCell.Type...) {
        for cell in cells {
            self.register(UINib(nibName: cell.identifier, bundle: nil), forCellReuseIdentifier: cell.identifier)
        }
    }
}
