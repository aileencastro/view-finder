//
//  AddPhotoViewController.swift
//  ViewFinder
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AddPhotoViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var imagePicker = UIImagePickerController()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
       
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func choseFromLibrary(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func chooseFromAlbum(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func savePhotoTapped(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
        //creating an instance of the photos entity from core data, a mini data base. this tells it to use the photos entity and that i want the context. storing all that info in a constant called photoToSave
            let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
            
            photoToSave.caption = captionText.text
            
            if let userImage = newImageView.image
            {
                if let userImageData = userImage.pngData() {
                    photoToSave.imageData = userImageData
                }
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
            navigationController?.popViewController(animated: true)
        }
    }
    @IBOutlet weak var captionText: UITextField!
    
    
    @IBOutlet weak var newImageView: UIImageView!
}
