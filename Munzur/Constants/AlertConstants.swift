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
    case custom(String), internetError, serverError, emailInvalid, passRequired,
    passEmpty, nameRequired, confirmMatch, phoneRequired, cameraSupport
    
    var value: String {
        switch self {
        case .custom(let message) : return message
        case .internetError: return "DISCONNECTED".localized
        case .serverError: return "SERVERERROR".localized
        case .emailInvalid: return "EMAILPLEASE".localized
        case .passRequired: return "PASSWORDINCORRECT".localized
        case .passEmpty: return "PASSWORDPLEASE".localized
        case .nameRequired: return "NAMEPLEASE".localized
        case .confirmMatch: return "CONFIRMNOTMATCH".localized
        case .phoneRequired: return "PHONEWRONG".localized
        case .cameraSupport: return "CAMERANOTSUPPORT".localized
        }
    }
}

enum AlertButton {
    case ok(NullableCompletion), cancel(NullableCompletion),
    custom(String, NullableCompletion), settings
    
    var name: String {
        switch self {
        case .ok: return "OK".localized
        case .cancel: return "CANCEL".localized
        case .custom(let value, _): return value
        case .settings: return "SETTINGS".localized
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
