//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Sanaz Khosravi on 9/4/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController{
   
    
    
    @IBAction func segmentedButton(_ sender: Any) {
        let defaults = UserDefaults.standard
        switch segmentedButtonOutlet.selectedSegmentIndex {
        case 0:
            defaults.set("15%", forKey: "percent")
            defaults.synchronize()
        case 1:
            defaults.set("20%", forKey: "percent")
            defaults.synchronize()
        case 2:
            defaults.set("25%", forKey: "percent")
            defaults.synchronize()
        default:
           defaults.synchronize()
        }
    }
    
    @IBOutlet var segmentedButtonOutlet: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let stringValue = defaults.string(forKey: "percent") ?? "15%"
        if stringValue == "25%"{
            segmentedButtonOutlet.selectedSegmentIndex = 2
        }else if stringValue == "20%"{
            segmentedButtonOutlet.selectedSegmentIndex = 1
        }else{
            segmentedButtonOutlet.selectedSegmentIndex = 0
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor(red: 120.0/255.0, green: 255.0/255.0, blue: 200.0/255.0, alpha: 1.0)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

}
