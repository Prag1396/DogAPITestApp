//
//  SettingsVC.swift
//  UNUMTestApp
//
//  Created by Pragun Sharma on 8/16/18.
//  Copyright © 2018 Pragun Sharma. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var themeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        // Do any additional setup after loading the view.
    }

    @IBAction func backbtnpressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let val = UserDefaults.standard.value(forKey: "LightTheme") {
            switcher.setOn(val as! Bool, animated: false)
        }
        
    }
    
    @IBAction func switchtapped(_ sender: UISwitch) {
        
        Theme.current = sender.isOn ? LightTheme(): DarkTheme()
        UserDefaults.standard.set(sender.isOn, forKey: "LightTheme")
        
        applyTheme()
    }
    
    fileprivate func applyTheme() {
        self.view.backgroundColor = Theme.current.cellBg
        themeLabel.textColor = Theme.current.textColor
    }
    
    
}
