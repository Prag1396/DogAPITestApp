//
//  ThemeProtocol.swift
//  UNUMTestApp
//
//  Created by Pragun Sharma on 8/16/18.
//  Copyright © 2018 Pragun Sharma. All rights reserved.
//

import UIKit

protocol ThemeProtocol {
    var textColor: UIColor { get }
    var cellBg: UIColor { get }
    var shadowColor: CGColor { get }
    var iconColor: UIColor { get }

}
