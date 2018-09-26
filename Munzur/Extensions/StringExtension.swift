import Foundation

extension String {
    func alphabetsOnly(with string: String) -> String {
        let allowed = Validator.alphaNumeric
        var newString = self
        for char in self {
            if !allowed.contains(char) {
                newString = newString.replacingOccurrences(of: "\(char)", with: string)
            }
        }
        return newString
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
}
