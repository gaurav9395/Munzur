import Foundation

final class UserDefaultsManager {
    static func set(value: Any, forKey key: UserDefaultConstants) {
        UserDefaults.standard.setValue(value, forKey: key.value)
        UserDefaults.standard.synchronize()
    }
    
    static func nullifyUserDetails() {
        UserDefaultsManager.emailSignup = nil
        UserDefaultsManager.socialImage = nil
        UserDefaultsManager.socialToken = nil
        UserDefaultsManager.socialType = nil
        UserDefaultsManager.socialID = nil
    }
    
    static var deviceToken: Data? {
        set {
            set(value: newValue as Any, forKey: .deviceToken)
        } get {
            guard let token = UserDefaults.standard.data(forKey: UserDefaultConstants.deviceToken.value) else {
                return nil
            }
            return token
        }
    }
    
    static var loginToken: String? {
        set {
            set(value: newValue ?? "", forKey: .loginToken)
            if newValue == nil {
                UserDefaultsManager.isProfileComplete = false
                nullifyUserDetails()
                nullifyUserProfile()
            }
        } get {
            guard let token = UserDefaults.standard.string(forKey: UserDefaultConstants.loginToken.value) else {
                return nil
            }
            return token == "" ? nil : token
        }
    }
    
    static var launchedEarlier: Bool {
        set {
            set(value: newValue, forKey: .launchedEarlier)
        } get {
            return UserDefaults.standard
                .bool(forKey: UserDefaultConstants.launchedEarlier.value)
        }
    }
    
    static var isProfileComplete: Bool {
        set {
            set(value: newValue, forKey: .isProfileComplete)
        } get {
            return UserDefaults.standard
                .bool(forKey: UserDefaultConstants.isProfileComplete.value)
        }
    }
    
    static var emailSignup: String? {
        set {
            set(value: newValue ?? "", forKey: .emailSignup)
        } get {
            guard let email = UserDefaults.standard.string(forKey: UserDefaultConstants.emailSignup.value) else {
                return nil
            }
            return email == "" ? nil : email
        }
    }
    
    static var lattitude: String? {
        set {
            set(value: newValue ?? "", forKey: .lattitude)
        } get {
            guard let lattitude = UserDefaults.standard.string(forKey: UserDefaultConstants.lattitude.value) else {
                return nil
            }
            return lattitude == "" ? nil : lattitude
        }
    }

    static var longitude: String? {
        set {
            set(value: newValue ?? "", forKey: .longitude)
        } get {
            guard let longitude = UserDefaults.standard.string(forKey: UserDefaultConstants.longitude.value) else {
                return nil
            }
            return longitude == "" ? nil : longitude
        }
    }
    
    static var socialID: String? {
        set {
            set(value: newValue ?? "", forKey: .socialID)
        } get {
            guard let id = UserDefaults.standard
                .string(forKey: UserDefaultConstants.socialID.value) else {
                return nil
            }
            return id == "" ? nil : id
        }
    }

    static var socialType: String? {
        set {
            set(value: newValue ?? "", forKey: .socialType)
        } get {
            guard let type = UserDefaults.standard.string(forKey: UserDefaultConstants.socialType.value) else {
                return nil
            }
            return type == "" ? nil : type
        }
    }

    static var socialToken: String? {
        set {
            set(value: newValue ?? "", forKey: .socialToken)
        } get {
            guard let token = UserDefaults.standard.string(forKey: UserDefaultConstants.socialToken.value) else {
                return nil
            }
            return token == "" ? nil : token
        }
    }
    
    static var socialImage: String? {
        set {
            set(value: newValue ?? "", forKey: .socialImage)
        } get {
            guard let image = UserDefaults.standard.string(forKey: UserDefaultConstants.socialImage.value) else {
                return nil
            }
            return image == "" ? nil : image
        }
    }
}
