import Foundation

extension NSNotification.Name {
    static let home = NSNotification.Name(rawValue: "refreshHomeAfterSomeAction")
    static let fbLogin = NSNotification.Name(rawValue: "userJustLoggedinFromFacebook")
    static let googleLogin = NSNotification.Name(rawValue: "userJustLoggedinFromGoogle")
    static let chatMessage = NSNotification.Name(rawValue: "recievedAChatMessage")
    static let forwardMessage = NSNotification.Name(rawValue: "forwardTheRecievedChatMessage")
    static let refreshFeeds = NSNotification.Name(rawValue: "refreshFeedForCurrentUser")
    static let refreshChat = NSNotification.Name(rawValue: "refreschChatForNewMessages")
}

