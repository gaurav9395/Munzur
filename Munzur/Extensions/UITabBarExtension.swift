import UIKit

extension UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        
        if UIDevice().userInterfaceIdiom == .phone {
            if UIScreen.main.nativeBounds.height <= 2208 {
                sizeThatFits.height = 54.5
//                selectionIndicatorImage = #imageLiteral(resourceName: "dummy")
            } else {
                sizeThatFits.height = 94.5
//                selectionIndicatorImage = #imageLiteral(resourceName: "dummyX")
            }
        }
        return sizeThatFits
    }
}
