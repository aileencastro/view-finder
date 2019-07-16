//
//  PhotoTableViewController.swift
//  ViewFinder
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

var photos : [Photos] = []

class PhotoTableViewController: UITableViewController {
    
    func getPhotos(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            //now we need to search thru core data to find our photos/captions
            if let coreDataPhotos = try? context.fetch(Photos.fetchRequest()) as? [Photos]{
                photos = coreDataPhotos
                tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return photos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let cellPhoto = photos[indexPath.row]
        
        cell.textLabel?.text = cellPhoto.caption
        
        if let cellPhotoImageData = cellPhoto.imageData {
            if let cellPhotoImage = UIImage(data: cellPhotoImageData){
                cell.imageView?.image = cellPhotoImage
            }
        }

        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getPhotos()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: photos[indexPath.row])
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{
            // need to get access to View Controller we want to move to
            if let photoDetailView = segue.destination as? PhotoDetailViewController {
                //now we need to say, whichever row was tapped, take that photo
                //and send it to the over view
                if let photoToSend = sender as? Photos {
                    photoDetailView.photo = photoToSend
                }
            }
        }
    }
   
    
//     Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//         Return false if you do not want the specified item to be editable.
        return true
    }
 

    
//     Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//             Delete the row from the data source
           if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
           {
            //now that we have access to Core Data we need to select the row, then delete the photo
            //we also need to save the context and reload
            let photoToDelete = photos[indexPath.row]
            //now delete, then save, then reload
            context.delete(photoToDelete)
            //save the context, then reload
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            getPhotos()
            }
        }

    }
    
}
