import Foundation

final public class Validator {
    
    static let NumberSet = "0123456789"
    static let characterSet = "abcdefghijklmnopqrstuvwxyz "

    /**
     Method to check if the email is valid or not.
     - parameter email: email string entered by the user
     - returns Bool: returns a bool as per the validity of the passed email
     */
    func isValid(email: String) -> Bool {
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    func isValidPhone(number: String) -> Bool {
        let phoneRegex: String = "^\\+[0-9]{2,3} [0-9]{9,10}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: number)
    }
    
    /**
     Method to check if the password is valid or not.
     - parameter email: email string entered by the user
     - returns Bool: returns a bool as per the validity of the passed email
     */
    func isValidPassword(_ text: String) -> Bool {
//        let emailRegex = "^.*(?=.{5,16})(?=.*[a-zA-Z])(?=.*\\d)[a-zA-Z0-9!@#$%&*_.]+$"
//        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: text)
        return text.count > 5 && text.count < 16
    }
    
    func isAlphabet(_ text: String) -> Bool {
        let phoneRegex: String = ".*[^A-Za-z].*"
        return NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: text)
    }
}
