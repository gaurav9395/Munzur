import UIKit

// MARK : - Empty dataset
extension UIView {
    func emptyDataSetLabelFor(_ view: UIView, with message: Messages) -> UILabel {
        let label = UILabel(frame: view.frame)
        label.font = UIFont.custom(font: .regular, ofSize: 15)
        label.textColor = Constants.Colors.blue
        label.textAlignment = .center
        label.text = message.value.capitalized
        label.numberOfLines = 0
        return label
    }
    
    func emptyDataset(image: UIImage, over view: UIView) -> UIView {
        let imgView = UIImageView(image: image)
        imgView.frame = view.bounds
        return imgView
    }
}

// MARK : - Rotation animation
extension UIView {
    struct Keys {
        private init() {}
        static let rotation = "rotationOfView"
    }
    
    func startRotating(duration: Double = 1) {
        if self.layer.animation(forKey: Keys.rotation) == nil {
            let animate = CABasicAnimation(keyPath: "transform.rotation")
            animate.duration = duration
            animate.repeatCount = Float.infinity
            animate.fromValue = 0.0
            animate.toValue = Float(Double.pi * 2.0)
            self.layer.add(animate, forKey: Keys.rotation)
        }
    }
    
    func stopRotating() {
        if self.layer.animation(forKey: Keys.rotation) != nil {
            self.layer.removeAnimation(forKey: Keys.rotation)
        }
    }
}

// MARK : - Gradient
extension UIView {
    enum Direction {
        case horizontal, vertical
        
        var startPoint: CGPoint {
            switch self {
            case .horizontal: return CGPoint(x: 0.0, y: 0.5)
            case .vertical: return CGPoint(x: 0.5, y: 0.0)
            }
        }
        
        var endPoint: CGPoint {
            switch self {
            case .horizontal: return CGPoint(x: 1.0, y: 0.5)
            case .vertical: return CGPoint(x: 0.5, y: 0.1)
            }
        }
    }
    
    func addGradientWith(colors: UIColor..., direction: Direction) {
        let gradient = CAGradientLayer()
        gradient.colors = colors.map { $0.cgColor }
        gradient.frame = layer.frame
        gradient.startPoint = direction.startPoint
        gradient.endPoint = direction.endPoint
        layer.insertSublayer(gradient, at: 0)
    }
}
