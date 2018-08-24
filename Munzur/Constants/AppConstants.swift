import UIKit

enum Constants {
    struct Colors {
        private init() {}
        
        static let green = UIColor.colorWithCodes(red: 131, green: 237, blue: 102, alpha: 1)
        static let blue = UIColor.colorWithCodes(red: 11, green: 148, blue: 199, alpha: 1)
        static let placeholderDark = UIColor.colorWithCodes(red: 41, green: 41, blue: 41, alpha: 1)
        static let placeholderLight = UIColor.white
        static let gray112 = UIColor.colorWithCodes(red: 112, green: 112, blue: 112, alpha: 1)
    }
    
    static let googleKey = "AIzaSyCntqpsAENyhe4zMbr533RDtZ7JAzuCCQw"
    static let defaultLoginToken = "temporaryTokenForCompleteProfile"
}
