import UIKit

enum Font {
    case regular, bold, light, black
    
    var value: String {
        switch self {
        case .regular: return "Poppins-Regular"
        case .bold: return "Poppins-Bold"
        case .light: return "Poppins-Light"
        case .black: return "Poppins-Black"
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
