import Foundation

enum UserDefaultConstants {
    case deviceToken, loginToken, launchedEarlier, isProfileComplete, emailSignup,
    lattitude, longitude, socialID, socialType, socialToken, socialImage
    
    case name, email, image, bio, contact, id, followingCount, followerCount, jeebsCount

    var value: String {
        switch self {
        case .deviceToken: return "deviceTokenSavedWhileRegisteringForPushNotifications"
        case .loginToken: return "usersLoginTokkenSavedWhileLoggingin"
        case .launchedEarlier: return "applicationIsNotBeingLaunchedForTheFirstTime"
        case .isProfileComplete: return "didUserCompletedHisRequiredProfile"
        case .emailSignup: return "emailSavedWhileUserSignedupButDidNotCompletedProfile"
        case .lattitude: return "lattitudesOfUsersCurrentLocation"
        case .longitude: return "longitudesOfUsersCurrentLocation"
        case .socialID: return "userIdStoredWhileSocialLogin"
        case .socialType: return "socialTypeStoredWhileSocialLogin"
        case .socialToken: return "accessTokenStoredWhileSocialLogin"
        case .socialImage: return "userImageStoredWhileSocialLogin"
        // user's profile
        case .name: return "currentUserFullName"
        case .email: return "currentUserEmailAddress"
        case .image: return "currentUserProfilePicUrl"
        case .bio: return "currentUserBio"
        case .contact: return "currentUserContactNumber"
        case .id: return "currentUserID"
        case .followerCount: return "currentUserFolowerCount"
        case .followingCount: return "currentUserFollowingCount"
        case .jeebsCount: return "currentUserJeebsCount"
        }
    }
}

