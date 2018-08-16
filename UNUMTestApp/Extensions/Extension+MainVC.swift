//
//  Extension+MainVC.swift
//  UNUMTestApp
//
//  Created by Pragun Sharma on 8/16/18.
//  Copyright © 2018 Pragun Sharma. All rights reserved.
//

import UIKit

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.dogbreedArray.count - 1 && self.dogbreedArray.count >= 14 {
            if self.dogbreedArray.count < self.totalEnteries {
                //present activity indicator
                self.setUpActivityIndicator()
                self.indicator.startAnimating()
              
                self.index = self.dogbreedArray.count
                if (self.totalEnteries - self.dogbreedArray.count >= 15) {
                    
                    self.limit = self.index + 15
                } else {
                    self.limit = self.index + (self.totalEnteries - self.dogbreedArray.count)
                }
            }
            self.downloadDetails {
                self.perform(#selector(self.loadtable), with: nil, afterDelay: 1.0)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.dogbreedArray.count > 0 {
            return self.dogbreedArray.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "petCell", for: indexPath) as? PetCell {
            if self.dogbreedArray.count > 0 {
                let petObj = self.dogbreedArray[indexPath.row]
                
                cell.configureCell(petDataObj: petObj)
                
            }
            
            return cell
        } else {
            return PetCell()
        }
    }
    
    
}

