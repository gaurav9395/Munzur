import UIKit

enum Font {
    case regular, bold, light, black
    
    var value: String {
        switch self {
        case .regular: return "adineuePRO-Regular"
        case .bold: return "adineuePRO-Bold"
        case .light: return "adineuePRO-Light"
        case .black: return "adineuePRO-Black"
        }
    }
}

extension UIFont {
    static func custom(font: Font, ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: font.value, size: size) else {
            return systemFont(ofSize: size)
        }
        return font
    }
}
