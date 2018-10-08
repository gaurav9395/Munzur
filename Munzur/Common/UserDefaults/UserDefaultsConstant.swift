import Foundation

enum UserDefaultConstants {
    case deviceToken, userId, lattitude, longitude

    var value: String {
        switch self {
        case .deviceToken: return "deviceTokenSavedWhileRegisteringForPushNotifications"
        case .userId: return "usersIdentificationNumber"
        case .lattitude: return "lattitudesOfUsersCurrentLocation"
        case .longitude: return "longitudesOfUsersCurrentLocation"
        }
    }
}
