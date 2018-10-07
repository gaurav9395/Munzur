import Foundation
import Alamofire

enum Endpoints {
    private var base: String {
        return "http://ec2-18-191-231-1.compute-1.amazonaws.com:6789/"
    }
    
    case signup(Parameters), signin(Parameters)
    
    var url: String {
        switch self {
        case .signup: return "\(base)signup"
        case .signin: return "\(base)login"
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
