import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    // MARK: - Properties
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.photoImageView.isUserInteractionEnabled = true
    }

    // MARK: - Actions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.mealLabel.text = textField.text
        return true
    }

    @IBAction func setDefaultLabel(_ sender: Any) {
        self.nameTextField.resignFirstResponder()
        self.mealLabel.text = self.nameTextField.text
    }

    @IBAction func selectPhotoFromLibrary(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true) {
            print("Hello Swift 4.0.3")
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provied the following: \(info)")
        }
        
        self.photoImageView.image = selectedImage
        self.dismiss(animated: true, completion: nil)
    }
}
