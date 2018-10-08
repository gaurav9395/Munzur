import Foundation
import Alamofire

enum Endpoints {
    private var base: String {
        return "http://ec2-18-191-231-1.us-east-2.compute.amazonaws.com:4567/"
    }
    
    case signup(Parameters), signin(Parameters), profile(userId: Int), base, bottles
    
    var url: String {
        switch self {
        case .signup: return "\(base)signup"
        case .signin: return "\(base)login"
        case .profile(userId: let id): return "\(base)userProfile?userid=\(id)"
        case .base: return base
        case .bottles: return "\(base)getBottleInfo"
        }
    }

    var method: HTTPMethod {
        switch self {
        default: return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .signup(let parms), .signin(let parms):
            return parms
        default: return nil
        }
    }
}
