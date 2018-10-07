import Foundation
import Alamofire

final class WebService {
    
    static let shared = WebService()
    private init(){}
    
    private let failureHandler = FailureHandler()
    typealias WebResponse = (Bool, Int, NSDictionary, String) -> ()
    typealias Media = [String: Data]?
    
    /**
     Method for interacting with the server for data
     - parameter api: Endpoints object for preferred data from the server
     - parameter withHiddenIndicator: True if you want to interact without the Loading indicator
     - parameter responseClosure: A Closure to handle the response from the server
     */
    func requestFor(api: Endpoints, withHiddenIndicator: Bool = false,
                    responseClosure: @escaping WebResponse) {
        
        if !NetworkReachabilityManager()!.isReachable {
            displayAlertWithSettings()
            return
        }
        
        if !withHiddenIndicator {
            Indicator.shared.show()
        }
        
        printRequest(api)
        Alamofire.request(api.url, method: api.method, parameters: api.parameters, encoding: api.encoding, headers: api.header).responseJSON { (response) in
            self.handle(response, responseClosure: { (result, code, data, message)  in
                responseClosure(result, code, data, message)
            })
        }
    }
    
    /**
     Method for interacting with the server for data
     - parameter api: Endpoints object for preferred data from the server
     - parameter parameters: Parameter dictionary, needs to be nil for a get api
     - parameter imgMedia: Data of images to be uploaded in the form of [String: Data]
     - parameter videoMedia: Data of videos to be uploaded in the form of [String: Data]
     - parameter audioMedia: Data of audios to be uploaded in the form of [String: Data]
     - parameter withHiddenIndicator: True if you want to interact without the Loading indicator
     - parameter responseClosure: A Closure to handle the response from the server
     */
    func uploadMediaToServerWith(api: Endpoints, imgMedia: Media = nil,
                                 videoMedia: Media = nil,
                                 audioMedia: Media = nil,
                                 withHiddenIndicator: Bool = false,
                                 responseClosure: @escaping WebResponse) {
        
        if !NetworkReachabilityManager()!.isReachable {
            displayAlertWithSettings()
            return
        }
        
        if !withHiddenIndicator {
            Indicator.shared.show()
        }
        
        printRequest(api)
        var url = try! URLRequest.init(url: api.url, method: api.method, headers: api.header)
        url.timeoutInterval = 180
        //Make a request to upload the data to server
        Alamofire.upload(multipartFormData: prepareMultipartFormdata(api, imgMedia, videoMedia, audioMedia), with: url) { (encodingResult) in
            switch encodingResult {
            case .success(let upload,_,_):
                upload.responseJSON(completionHandler: { (response) in
                    self.handle(response, responseClosure: { (result, code, data, message) in
                        responseClosure(result, code, data, message)
                    })
                })
            case .failure(let error):
                self.failureHandler.handle(error: error)
            }
        }
    }
}

// MARK: - Private Methods
extension WebService {
    private func printRequest(_ api: Endpoints) {
        debugPrint("********************************* API Request **************************************")
        debugPrint("Request URL:\(api.url)")
        debugPrint("Request Parameters: \(api.parameters ?? [: ])")
        debugPrint("Request Headers: \(api.header)")
    }
    
    private func handle(_ response: DataResponse<Any>, responseClosure: WebResponse) {
        debugPrint("Request Response:----------")
        debugPrint(NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue) ?? "")
        debugPrint("************************************************************************************")
        
        switch response.result {
        case .success(_):
            if let data = response.result.value as? NSDictionary {
                if let statusCode = response.response?.statusCode {
                    switch statusCode {
                    case 200, 400:
                        var message = String()
                        if let msg = data.value(forKeyPath: "error.message") as? String {
                            message = msg
                        } else if let msg = data["message"] as? String {
                            message = msg
                        } else if let msg = data.value(forKeyPath: "error.msg") as? String {
                            message = msg
                        }
                        
                        Indicator.shared.hide()
                        responseClosure(statusCode == 200, statusCode, data, message)
                    default:
                        failureHandler.handle(json: data, code: statusCode)
                        responseClosure(false, statusCode, data, "")
                    }
                } else {
                    responseClosure(false, 00, data, "")
                }
            }
        case .failure(let error):
            Indicator.shared.hide()
            failureHandler.handle(error: error)
        }
    }
    
    private func prepareMultipartFormdata(_ api: Endpoints,
                                          _ imgMedia: Media = nil,
                                          _ videoMedia: Media = nil,
                                          _ audioMedia: Media = nil) -> (MultipartFormData) -> () {
        let formdataPrepared: (MultipartFormData) -> () = {
            formdata in
            if let params = api.parameters {
                for (key, value) in params {
                    formdata.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            }
            if let images = imgMedia {
                for (key,value) in images {
                    let interval = NSDate().timeIntervalSince1970 * 1000
                    let imgMimeType : String = "image/jpeg"
                    let imgFileName = "img\(interval).jpeg"
                    formdata.append(value, withName: key, fileName: imgFileName, mimeType: imgMimeType)
                }
            }
            if let audios = audioMedia {
                for (key,value) in audios {
                    let interval = NSDate().timeIntervalSince1970 * 1000
                    let audioMimeType = "audio/mpeg"
                    let audioFileName = "audio\(interval).mp3"
                    formdata.append(value, withName: key, fileName: audioFileName, mimeType: audioMimeType)
                }
            }
            if let videos = videoMedia {
                for (key,value) in videos {
                    let interval = NSDate().timeIntervalSince1970 * 1000
                    let videoMimeType = "video/mp4"
                    let videoFileName = "vid\(interval).mp4"
                    formdata.append(value, withName: key, fileName: videoFileName, mimeType: videoMimeType)
                }
            }
        }
        return formdataPrepared
    }
    
    private func displayAlertWithSettings() {
        AppDelegate.shared.window?.currentViewController()?
            .showAlertControllerWith(message: .internetError, buttons: .ok(nil), .settings)
    }
}
