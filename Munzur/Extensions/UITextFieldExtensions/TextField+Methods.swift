import UIKit

extension UITextField {
    var isBlank: Bool {
        return trimmedText.isEmpty
    }
    
    var trimmedText: String {
        return (self.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    @IBInspectable var placeholderColor: UIColor? {
        get {
            return self.placeholderColor
        } set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[
                NSAttributedStringKey.foregroundColor: newValue!,
                NSAttributedStringKey.font: UIFont.custom(font: .light, ofSize: 12)])
        }
    }
    
    func setRightAccessory(image: UIImage) {
        let accessory = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        accessory.image = image
        self.rightViewMode = .always
        self.rightView = accessory
    }
    
    @IBInspectable var rightAccessory: UIImage? {
        set {
            if newValue != nil {
                let accessory = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
                accessory.image = newValue!
                rightViewMode = .always
                rightView = accessory
            } else {
                rightViewMode = .never
                rightView = nil
            }
        }
        get {
            if let imageView = self.rightView as? UIImageView {
                return imageView.image
            } else {
                return nil
            }
        }
    }
}

// MARK : - Password accessoryView
extension UITextField {
    func showPasswordAccessoryWith(black color: Bool) {
        let accessory = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        accessory.setImage(!color ? #imageLiteral(resourceName: "password_hidden"):#imageLiteral(resourceName: "eyeoff@x"), for: .normal)
        accessory.setImage(!color ?#imageLiteral(resourceName: "password_eye_icon"):#imageLiteral(resourceName: "eyeopen@x"), for: .selected)
        accessory.addTarget(self, action: #selector(accessoryHandler), for: .touchUpInside)
        rightViewMode = .always
        rightView = accessory
    }

    @objc private func accessoryHandler(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.isSecureTextEntry = !sender.isSelected
    }
}
