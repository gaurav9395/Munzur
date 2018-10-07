import Foundation

final class FailureHandler {
    func handle(json: NSDictionary, code: Int) {
        Indicator.shared.hide()
        var message = String()
        if let msg = json.value(forKeyPath: "error.message") as? String {
            message = msg
        } else if let msg = json.value(forKeyPath: "message") as? String {
            message = msg
        }
        
        switch code {
        default:
            showAlertWith(message: message)
        }
    }
    
    func handle(error: Error) {
        Indicator.shared.hide()
        showAlertWith(message: error.localizedDescription)
    }
    
    private func showAlertWith(message: String, action: NullableCompletion = nil) {
        AppDelegate.shared.window?.currentViewController()?
            .showAlertControllerWith(message: .custom(message), buttons: .ok(action))
    }
}
