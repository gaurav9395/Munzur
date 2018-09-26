import Foundation

enum UserDefaultConstants {
    case deviceToken, loginToken

    var value: String {
        switch self {
        case .deviceToken: return "deviceTokenSavedWhileRegisteringForPushNotifications"
        case .loginToken: return "usersLoginTokkenSavedWhileLoggingin"
        }
    }
}

