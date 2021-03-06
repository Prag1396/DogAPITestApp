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
    
    let imageCache = NSCache<AnyObject, AnyObject>()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func configureCell(petDataObj: DogBreedModel) {
        
        self.breed.textColor = Theme.current.textColor
        self.backgroundColor = Theme.current.cellBg
        
        if let url = URL(string: petDataObj.imageURL) {
            
            if let cachedImage = imageCache.object(forKey: url as AnyObject) as? UIImage {
                
                self.petImage.image = cachedImage
                
            } else {
                self.downloadImage(withImageURL: url, downloadCompleted: { (status, error, _image) in
                    if (error != nil) {
                        //present alert
                        print("here")
                    }
                    else {
                        if let _img = _image {
                            DispatchQueue.main.async {
                                let r_image = _img.resizeImage(image: _img, newSize: CGSize(width: self.bounds.size.width, height: 220))
                                self.breed.text = petDataObj.breed.capitalizingFirstLetter()
                                self.imageCache.setObject(r_image, forKey: url as AnyObject)
                                self.petImage.image = r_image
                                self.petImage.beutify()
                            }
                        }
                    }
                })
            }
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
