//
//  ViewController.swift
//  tips
//
//  Created by Xuefan Zhang on 4/7/15.
//  Copyright (c) 2015 Xuefan Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipController: UISegmentedControl!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipController.layer.cornerRadius = 0.0
        
        tipController.layer.borderWidth = 2.0
        
        billField.layer.cornerRadius = 5.0
        
        [billField .becomeFirstResponder()]
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var defaultTipIndex = defaults.integerForKey("defaultTipIndex")
        
        billField.text = defaults.stringForKey("defaultBill")
        
        tipController.selectedSegmentIndex = defaultTipIndex
        
        onEditChanged(billField)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditChanged(sender: AnyObject) {
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(billField.text, forKey: "defaultBill")
        defaults.synchronize()
        
        var tipPercentages = [0.18, 0.2, 0.22]
        
        var tipPercentage = tipPercentages[tipController.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue
        
        
        var tip = billAmount * tipPercentage
        
        var total = billAmount + tip
        
        if tip > 0 {
            tipLabel.text = String(format:"$%.2f", tip)
        } else {
            tipLabel.text = ""
        }
        
        totalLabel.text = String(format:"$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

