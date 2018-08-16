//
//  DogBreedModel.swift
//  UNUMTestApp
//
//  Created by Pragun Sharma on 8/16/18.
//  Copyright © 2018 Pragun Sharma. All rights reserved.
//

import Foundation

class DogBreedModel {
    
    private var _breed: String!
    private var _ImageURL: String!

    var breed: String {
        if _breed == nil {
            _breed = ""
        }
        return _breed
    }
    
    var imageURL: String {
        if _ImageURL == nil {
            _ImageURL = ""
        }
        return _ImageURL
    }

    init(breed: String, imageURL: String ) {
        self._breed = breed
        self._ImageURL = imageURL
    }
}
