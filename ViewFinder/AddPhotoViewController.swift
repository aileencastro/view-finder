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
    
}
