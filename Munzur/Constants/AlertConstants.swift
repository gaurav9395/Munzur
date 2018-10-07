import UIKit

typealias NullableCompletion = (() -> ())?

enum AlertTitle {
    case appName
    case custom(String)
    
    var value: String {
        switch self {
        case .appName:
            guard let name = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String else {
                return "Jeebo"
            }
            return name
        case .custom(let name): return name
        }
    }
}

enum Messages {
    case custom(String), internetError, serverError, emailInvalid,
    passEmpty, nameRequired, confirmMatch, phoneRequired, cameraSupport, location, countryRequired,
    addressRequired
    
    var value: String {
        switch self {
        case .custom(let message) : return message
        case .internetError: return "Seems like you are disconnected, Please connect to the internet"
        case .serverError: return "Could not connect to our server, Please try again later"
        case .emailInvalid: return "Please enter your valid email address"
        case .passEmpty: return "Please enter your password"
        case .nameRequired: return "Please enter your name"
        case .confirmMatch: return "Password and confirm password doesn't match"
        case .phoneRequired: return "Please enter your correct Phone Number"
        case .cameraSupport: return "Camera is not supported by your device"
        case .location: return "Please allow location from settings"
        case .countryRequired: return "Please enter your country"
        case .addressRequired: return "Please enter your current address"
        }
    }
}

enum AlertButton {
    case ok(NullableCompletion), cancel(NullableCompletion),
    custom(String, NullableCompletion), settings
    
    var name: String {
        switch self {
        case .ok: return "OK"
        case .cancel: return "Cancel"
        case .custom(let value, _): return value
        case .settings: return "Settings"
        }
    }
    
    var action: NullableCompletion {
        switch self {
        case .ok(let closure): return closure
        case .cancel(let closure): return closure
        case .custom(_, let closure): return closure
        case .settings: return Utility.methodToOpenSettings
        }
    }
    
    var style: UIAlertActionStyle {
        switch self {
        case .cancel(_): return .cancel
        default: return .default
        }
    }
}
