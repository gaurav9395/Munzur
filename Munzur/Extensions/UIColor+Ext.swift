import UIKit

extension UIColor {
    static func colorWithCodes(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    static func colorWithCode(all: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: all/255, green: all/255, blue: all/255, alpha: alpha)
    }
}
