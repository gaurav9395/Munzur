import UIKit

final class Indicator {
    static let shared = Indicator()
    
    private var blurImg = UIImageView()
    private var indicator = UIActivityIndicatorView()
    
    private init() {
        blurImg.frame = UIScreen.main.bounds
        blurImg.backgroundColor = .clear
        blurImg.isUserInteractionEnabled = true
        indicator.activityIndicatorViewStyle = .whiteLarge
        indicator.center = blurImg.center
        indicator.startAnimating()
        indicator.color = .black
    }
    
    func show(withBackground value: Bool = false) {
        DispatchQueue.main.async() {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            self.blurImg.backgroundColor = value ? .white : .clear
            UIApplication.shared.keyWindow?.addSubview(self.blurImg)
            UIApplication.shared.keyWindow?.addSubview(self.indicator)
        }
    }
    
    func hide(){
        DispatchQueue.main.async() {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.blurImg.removeFromSuperview()
            self.indicator.removeFromSuperview()
        }
    }
}
