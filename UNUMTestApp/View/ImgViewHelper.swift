//
//  ImgViewHelper.swift
//  UNUMTestApp
//
//  Created by Pragun Sharma on 8/16/18.
//  Copyright © 2018 Pragun Sharma. All rights reserved.
//

import UIKit

extension UIImageView {

    func beutify() {
        
        self.layer.shadowColor = Theme.current.shadowColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.masksToBounds = false
    }
 

}
