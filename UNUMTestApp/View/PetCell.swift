//
//  PetCell.swift
//  UNUMTestApp
//
//  Created by Pragun Sharma on 8/16/18.
//  Copyright © 2018 Pragun Sharma. All rights reserved.
//

import UIKit

class PetCell: UITableViewCell {
    
    @IBOutlet weak var breed: UILabel!
    @IBOutlet weak var petImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(petDataObj: DogBreedModel) {
        
        if let url = URL(string: petDataObj.imageURL) {
            print(petDataObj.imageURL)
            self.downloadImage(withImageURL: url, downloadCompleted: { (status, error, _image) in
                if (error != nil) {
                    //present alert
                    print("here")
                }
                else {
                    if let _img = _image {
                        DispatchQueue.main.async {
                            self.breed.text = petDataObj.breed.capitalizingFirstLetter()
                            self.petImage.image = _img
                        }
                    }
                }
            })
        }
        
    }
    
    func downloadImage(withImageURL url: URL, downloadCompleted: @escaping (_ status: Bool, _ error: Error?, _ image: UIImage?)->()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if (error != nil) {
                print("\(error.debugDescription)")
                downloadCompleted(false, error, nil)
            } else {
                if let data = data {
                    downloadCompleted(true, nil, UIImage(data: data))
                }
            }
            }.resume()
    }

}
