import UIKit

protocol ImagePickerRemoveImageDelegate {
    func userTappedOnRemoveButton()
}
var removeImageDelegate: ImagePickerRemoveImageDelegate?

extension UIViewController {
    var isPresented: Bool {
        return presentingViewController != nil ||
            navigationController?.presentingViewController?.presentedViewController === navigationController ||
            tabBarController?.presentingViewController is UITabBarController
    }
    
    private func openCamera(_ imagePicker: UIImagePickerController, isVideoAllowed: Bool, editingAllowed: Bool) {
        DispatchQueue.main.async {
            if UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                if isVideoAllowed {
                    imagePicker.mediaTypes =  ["public.image", "public.movie"]
                    imagePicker.videoMaximumDuration = 15
                }
                imagePicker.allowsEditing = editingAllowed
                self.present(imagePicker, animated: true, completion: nil)
            }  else {
                self.showAlertControllerWith(message: .cameraSupport, buttons: .ok(nil))
            }
        }
    }
    
    private func openGallery(_ imagePicker: UIImagePickerController, isVideo: Bool) {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        if isVideo {
            imagePicker.mediaTypes =  ["public.image", "public.movie"]
            imagePicker.videoMaximumDuration = 15
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
    func initiateImagePicker(_ imagePicker: UIImagePickerController, isVideo: Bool = false, editingAllowed: Bool = true, removeRequired: Bool = true) {
        let alert = UIAlertController(title: "Please select", message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) {
            UIAlertAction in
            self.openCamera(imagePicker, isVideoAllowed: isVideo, editingAllowed: editingAllowed)
        }
        let gallaryAction = UIAlertAction(title: "Photos", style: .default) {
            UIAlertAction in
            self.openGallery(imagePicker, isVideo: isVideo)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {
            UIAlertAction in
        }
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        if removeRequired {
            let removeAction = UIAlertAction(title: "Remove", style: .default) {
                UIAlertAction in
                removeImageDelegate?.userTappedOnRemoveButton()
            }
            alert.addAction(removeAction)
        }
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
