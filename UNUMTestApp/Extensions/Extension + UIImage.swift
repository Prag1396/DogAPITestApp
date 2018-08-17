//
//  Extension + UIImage.swift
//  UNUMTestApp
//
//  Created by Pragun Sharma on 8/16/18.
//  Copyright © 2018 Pragun Sharma. All rights reserved.
//

import UIKit

extension UIImage {
    func resizeImage(image: UIImage, newSize: CGSize) -> UIImage {
        let horizontalRatio = newSize.width / image.size.width
        let verticalRatio = newSize.height / image.size.height
        
        let ratio = max(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: image.size.width * ratio, height: image.size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
