import Foundation

extension UserDefaultsManager {
    static func nullifyUserProfile() {
        UserDefaultsManager.name = nil
        UserDefaultsManager.bio = nil
        UserDefaultsManager.contact = nil
        UserDefaultsManager.image = nil
        UserDefaultsManager.email = nil
        UserDefaultsManager.id = nil
        UserDefaultsManager.followerCount = nil
        UserDefaultsManager.followingCount = nil
        UserDefaultsManager.jeebsCount = nil
    }
    
    static var name: String? {
        set {
            set(value: newValue ?? "", forKey: .name)
        } get {
            guard let userName = UserDefaults.standard.string(forKey: UserDefaultConstants.name.value) else {
                return nil
            }
            return userName == "" ? nil : userName
        }
    }
    static var id: Int? {
        set {
            set(value: newValue ?? 0, forKey: .id)
        } get {
            let userName = UserDefaults.standard.integer(forKey: UserDefaultConstants.id.value)
            return userName == 0 ? nil : userName
        }
    }
    static var followerCount: Int? {
        set {
            set(value: newValue ?? 0, forKey: .followerCount)
        } get {
            let userName = UserDefaults.standard.integer(forKey: UserDefaultConstants.followerCount.value)
            return userName == 0 ? nil : userName
        }
    }
    static var jeebsCount: Int? {
        set {
            set(value: newValue ?? 0, forKey: .jeebsCount)
        } get {
            let userName = UserDefaults.standard.integer(forKey: UserDefaultConstants.jeebsCount.value)
            return userName == 0 ? nil : userName
        }
    }
    static var followingCount: Int? {
        set {
            set(value: newValue ?? 0, forKey: .followingCount)
        } get {
            let userName = UserDefaults.standard.integer(forKey: UserDefaultConstants.followingCount.value)
            return userName == 0 ? nil : userName
        }
    }
    static var email: String? {
        set {
            set(value: newValue ?? "", forKey: .email)
        } get {
            guard let userName = UserDefaults.standard.string(forKey: UserDefaultConstants.email.value) else {
                return nil
            }
            return userName == "" ? nil : userName
        }
    }
    static var contact: String? {
        set {
            set(value: newValue ?? "", forKey: .contact)
        } get {
            guard let userName = UserDefaults.standard.string(forKey: UserDefaultConstants.contact.value) else {
                return nil
            }
            return userName == "" ? nil : userName
        }
    }
    static var bio: String? {
        set {
            set(value: newValue ?? "", forKey: .bio)
        } get {
            guard let userName = UserDefaults.standard.string(forKey: UserDefaultConstants.bio.value) else {
                return nil
            }
            return userName == "" ? nil : userName
        }
    }
    static var image: String? {
        set {
            set(value: newValue ?? "", forKey: .image)
        } get {
            guard let userName = UserDefaults.standard.string(forKey: UserDefaultConstants.image.value) else {
                return nil
            }
            return userName == "" ? nil : userName
        }
    }
}
