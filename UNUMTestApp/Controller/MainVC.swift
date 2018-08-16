//
//  ViewController.swift
//  UNUMTestApp
//
//  Created by Pragun Sharma on 8/16/18.
//  Copyright © 2018 Pragun Sharma. All rights reserved.
//

import UIKit
import Alamofire

class MainVC: UIViewController {
    
    @IBOutlet weak var petTableView: UITableView!
    
    var dogbreedArray: [DogBreedModel] = [DogBreedModel]()
    
    var indicator = UIActivityIndicatorView()
    let loadingView: UIView = UIView()
    
    //Pagination
    var totalEnteries: Int = 0
    var limit: Int = 15
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        petTableView.delegate = self
        petTableView.dataSource = self
        
        DispatchQueue.global(qos: .userInteractive).async {
            self.downloadDetails {
                DispatchQueue.main.async {
                    self.petTableView.reloadData()
                }
            }
        }
    }
    
    func setUpActivityIndicator() {
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = self.view.center
        loadingView.backgroundColor = UIColor(red: 68/255, green: 68/255, blue: 68/255, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        indicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        indicator.bounds.origin.x = self.view.bounds.origin.x - 30
        indicator.bounds.origin.y = self.view.bounds.origin.y - 30
        
        loadingView.addSubview(indicator)
        view.addSubview(loadingView)
        
    }
    
    @objc func loadtable() {
        DispatchQueue.main.async {
            self.petTableView.reloadData()
            self.indicator.stopAnimating()
            self.loadingView.removeFromSuperview()
        }
    }
    
    
    func downloadDetails(downloadComplete: @escaping()->()) {
        
        self.downloadPetDetails(url: BREED_LIST_URL) { (dict) in
            while self.index < self.limit - 1 {
                let breed = Array(dict)[self.index].key
                let currimageURl = IMAGE_URL_PLACEHOLDERI + breed + IMAGE_URL_PLACEHOLDERII
                self.downloadImageURL(currentURL: currimageURl) { (url) in
                    
                    let petData = DogBreedModel(breed: breed, imageURL: url)
                    self.dogbreedArray.append(petData)
                    downloadComplete()
                }
                self.index = self.index + 1
            }

        }
    }
    
    func downloadImageURL(currentURL: String, downloadCompleted: @escaping(_ imageURL: String) -> ()) {
        Alamofire.request(currentURL).responseJSON { (response) in
       
            guard let imageDict = response.value as? Dictionary<String, AnyObject> else {return}
            guard let imageURL = imageDict["message"] as? String else { return }
            
            downloadCompleted(imageURL)
        }
    }

    //API call to download pet-details
    func downloadPetDetails(url: String, downloadCompleted: @escaping(_ dict: Dictionary<String, AnyObject>) -> ()) {
        
        guard let currentURL = URL(string: url) else { return }
        Alamofire.request(currentURL).responseJSON { (response) in
            
            
            guard let messageDict = response.value as? Dictionary<String, AnyObject> else {return}
            guard let mainDict = messageDict["message"] as? Dictionary<String, AnyObject> else {return}
            self.totalEnteries = mainDict.keys.count
            
            downloadCompleted(mainDict)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

