import Foundation

final class UserDefaultsManager {
    static func set(value: Any, forKey key: UserDefaultConstants) {
        UserDefaults.standard.setValue(value, forKey: key.value)
        UserDefaults.standard.synchronize()
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
    
    static var userId: Int? {
        set {
            guard let value = newValue else {
                UserDefaults.standard.removeObject(forKey: UserDefaultConstants.userId.value)
                return
            }
            set(value: value, forKey: .userId)
        } get {
            return UserDefaults.standard.value(forKey: UserDefaultConstants.userId.value) as? Int
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
}
