import UIKit
import Contacts

final class Contact {
    var name = String()
    var image = #imageLiteral(resourceName: "defaultImage")
    var email = String()
    var number = String()
    var imageAvailable = Bool()
    var selected = Bool()
    
    init(contact: CNContact) {
        if !contact.givenName.lowercased().contains(contact.familyName.lowercased()) {
            name = "\(contact.givenName.capitalized) \(contact.familyName.capitalized)"
        } else {
            name = "\(contact.givenName.capitalized)"
        }
        
        if let num = contact.phoneNumbers.first?.value.stringValue {
            number = num
        }
        
        if let emailAddress = contact.emailAddresses.first?.value as String? {
            email = emailAddress
        }
        
        imageAvailable = contact.imageDataAvailable
        if contact.imageDataAvailable {
            if let data = contact.imageData,
                let imageObj = UIImage(data: data) {
                image = imageObj
            }
        }
    }
}
