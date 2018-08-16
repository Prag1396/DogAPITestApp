//
//  Extension + String.swift
//  UNUMTestApp
//
//  Created by Pragun Sharma on 8/16/18.
//  Copyright © 2018 Pragun Sharma. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
