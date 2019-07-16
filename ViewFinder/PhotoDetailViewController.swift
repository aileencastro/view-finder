//
//  PhotoDetailViewController.swift
//  ViewFinder
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let realPhoto = photo {
            
            title = realPhoto.caption
            
            if let cellPhotoImageData = realPhoto.imageData {
                
                if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                    
                    photoDetail.image = cellPhotoImage
                }
            }
        }
    }
    
    @IBOutlet weak var photoDetail: UIImageView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var detailViewImageView: UIImageView!
    
    var photo : Photos? = nil
}
