import Foundation

enum UserDefaultConstants {
    case deviceToken, loginToken, lattitude, longitude

    var value: String {
        switch self {
        case .deviceToken: return "deviceTokenSavedWhileRegisteringForPushNotifications"
        case .loginToken: return "usersLoginTokkenSavedWhileLoggingin"
        case .lattitude: return "lattitudesOfUsersCurrentLocation"
        case .longitude: return "longitudesOfUsersCurrentLocation"
        }
    }
}
