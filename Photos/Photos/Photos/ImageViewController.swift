//
//  ImageViewController.swift
//  Photos
//
//  Created by Alex Davis on 10/18/19.
//  Copyright © 2019 Alex Davis. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var selectedImageView: UIImageView!
    
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePickerController.delegate = self
    }
    
    @IBAction func photoLibrarySelected(_ sender: UIBarButtonItem) {
         selectPhotoFromLibrary()
    }
    
    @IBAction func cameraSelected(_ sender: UIBarButtonItem) {
        takePhotoWithCamera()
    }
    
    func selectPhotoFromLibrary() {
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func takePhotoWithCamera() {
        if (!UIImagePickerController.isSourceTypeAvailable(.camera)) {
            presentAlert(title: "Error", message: "This device lacks a camera")
        } else {
            imagePickerController.allowsEditing = false
            imagePickerController.sourceType = .camera
            present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }

}
