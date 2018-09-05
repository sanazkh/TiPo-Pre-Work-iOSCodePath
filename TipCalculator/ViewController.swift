//
//  ViewController.swift
//  TipCalculator
//
//  Created by Sanaz Khosravi on 9/1/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var billAmount : Double = 0.0
    var tipCalculatedAmount : Double = 0.0
    var totalCalculatedAmount : Double = 0.0
    
    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var mySegmentedControl: UISegmentedControl!
    @IBOutlet var totalAmount: UILabel!
    @IBOutlet var tipAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        billAmountTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        updateSegmentedControl()
        billAmountTextField.becomeFirstResponder()
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        if billAmountTextField.text != nil{
            segmentedButtonAction((Any).self)
        }
    }
    
    @IBAction func segmentedButtonAction(_ sender: Any) {
        if billAmountTextField == nil{
            let alert = UIAlertController(title: "Error", message: "Please enter the bill amount first", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            billAmount = (billAmountTextField.text! as NSString).doubleValue
        }
        
        switch mySegmentedControl.selectedSegmentIndex {
        case 0:
            if billAmountTextField != nil{
                tipCalculatedAmount = 0.15 * billAmount
                tipAmount.text = String(format:"%.2f", tipCalculatedAmount)
                totalCalculatedAmount = tipCalculatedAmount + billAmount
                totalAmount.text = String(format:"%.2f", totalCalculatedAmount)
            }
        case 1:
            if billAmountTextField != nil{
                tipCalculatedAmount = 0.20 * billAmount
                tipAmount.text = String(format:"%.2f", tipCalculatedAmount)
                totalCalculatedAmount = tipCalculatedAmount + billAmount
                totalAmount.text = String(format:"%.2f", totalCalculatedAmount)
            }
        case 2:
            if billAmountTextField != nil{
                tipCalculatedAmount = 0.25 * billAmount
                tipAmount.text = String(format:"%.2f", tipCalculatedAmount)
                totalCalculatedAmount = tipCalculatedAmount + billAmount
                totalAmount.text = String(format:"%.2f", totalCalculatedAmount)
            }
        default:
            tipAmount.text = "0.00"
            totalAmount.text = "0.00"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateSegmentedControl()
        billAmountTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    func updateSegmentedControl(){
        let defaults = UserDefaults.standard
        let stringValue = defaults.string(forKey: "percent") ?? "15%"
        if stringValue == "25%"{
            mySegmentedControl.selectedSegmentIndex = 2
        }else if stringValue == "20%"{
            mySegmentedControl.selectedSegmentIndex = 1
        }else{
            mySegmentedControl.selectedSegmentIndex = 0
        }
    }
}

