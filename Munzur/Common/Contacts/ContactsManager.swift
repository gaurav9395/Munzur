import Foundation
import Contacts

final class ContactManager {
    
    static let shared = ContactManager()
    private init() {}
    
    private let contactStore = CNContactStore()
    private let authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)
    private let keysToFetch: [Any] = [
        CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
        CNContactPhoneNumbersKey,
        CNContactImageDataAvailableKey,
        CNContactImageDataKey,
        CNContactEmailAddressesKey
    ]
    
    private func checkIfContactsAreAccessible() -> Bool {
        return authorizationStatus == .authorized
    }
    
    private func askForPermission(completion: @escaping ()->()) {
        contactStore.requestAccess(for: .contacts) { access, accessError -> Void in
            if !access {
                if self.authorizationStatus == .denied {
                    Utility.executeTaskOnMainThread(after: 0) {
                        AppDelegate.shared.window?.currentViewController()?
                            .showAlertControllerWith(message: .contactsDeclined,
                                                     buttons: .cancel(nil), .settings)
                    }
                }
            } else {
                completion()
            }
        }
    }
    
    private func getContainersFromDevice() -> [CNContainer] {
        var allContainers = [CNContainer]()
        do {
            allContainers = try contactStore.containers(matching: nil)
        } catch {
            print("Error fetching containers")
        }
        return allContainers
    }
    
    /**
     This method returns all the contacts present in any container be it iCloud or the device of the user.
     - returns [CNContact]: returns list of contacts fetched from all containers, sorted alphabetically
     */
    private func contactsFromContainers() -> [CNContact] {
        var results = [CNContact]()
        for container in getContainersFromDevice() {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            do {
                let containerResults = try contactStore
                    .unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                results.append(contentsOf: containerResults)
            } catch {
                print("Error fetching results for container")
            }
        }
        return results.sorted { $0.givenName.localizedCaseInsensitiveCompare($1.givenName) == .orderedAscending }
    }
    
    private func contactsPresentInDevice(completion: @escaping ([CNContact])->()) {
        switch checkIfContactsAreAccessible() {
        case true:
            completion(contactsFromContainers())
        case false:
            askForPermission {
                completion(self.contactsFromContainers())
            }
        }
    }
    
    /**
     This method returns all the contacts in the completion handler, present in any container be it iCloud
     or the device of the user.
     - parameter completion: - A completion handler that takes an array of [Contact] as parameter.
     */
    func usersContacts(completion: @escaping ([Contact])->()) {
        contactsPresentInDevice { (contacts) in
            completion(contacts.compactMap { Contact(contact: $0) })
        }
    }
}
