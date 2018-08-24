import UIKit

final class Utility {
    
    /**
     Method to execute a task on main queue after a delay, can be used in place of perform selector for better performance.
     
     - parameter delay: A double value of time you want to perform the task after the current time
     - parameter task: A closure that encloses tha task you want to perform
     
     */
    static func executeTaskOnMainThread(after delay: Double, task: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { task() }
    }
    
    /**
     Method to execute a task on main queue after a delay, can be used in place of perform selector for better performance.
     
     - parameter delay: A double value of time you want to perform the task after the current time
     - parameter task: A closure that encloses tha task you want to perform
     */
    static func executeTaskOnBackgroundThread(after delay: Double, task: @escaping ()->()) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + delay) { task() }
    }
    
    /**
     Method to open the settings application
     */
    static let methodToOpenSettings = {
        let url:URL = URL(string: UIApplicationOpenSettingsURLString)!
        if #available(iOS 10, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: {
                (success) in })
        } else {
            guard UIApplication.shared.openURL(url) else {
                AppDelegate.shared.window?.rootViewController?.showAlertControllerWith(message: .internetError, buttons: .ok(nil))
                return
            }
        }
    }
    
    /**
     Method for a uiview for tableview header as per app designs
     - parameter tableView: A UItablView object
     - parameter title: A string to display in the header title
     - parameter height: A CGFloat object for desired header height
     */
    static func viewForHeader(_ tableView: UITableView, title: String,
                       height: CGFloat) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: height))
        view.backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 8.5, y: 0, width: view.bounds.width - 8.5, height: height))
        label.font = UIFont.custom(font: .regular, ofSize: 10)
        label.text = title
        label.textColor = UIColor.colorWithCodes(red: 41, green: 41, blue: 41, alpha: 1)
        view.addSubview(label)
        return view
    }
}
