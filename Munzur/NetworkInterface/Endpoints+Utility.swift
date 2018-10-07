import Alamofire

extension Endpoints: URLRequestConvertible {
    var encoding: ParameterEncoding {
        switch method {
        default: return JSONEncoding.default
        }
    }
    
    var header: HTTPHeaders {
        var headers = HTTPHeaders()
        switch self {
        default: headers = [:]
//            if let token = UserDefaultsManager.loginToken {
//                if token != Constants.defaultLoginToken {
//                    headers["x-access-token"] = token
//                }
//            }
        }
        return headers
    }
    
    func asURLRequest() throws -> URLRequest {
        return try! URLRequest(url: self.url, method: self.method, headers: self.header)
    }
}
