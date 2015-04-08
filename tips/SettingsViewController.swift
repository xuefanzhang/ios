//
//  SettingsViewController.swift
//  tips
//
//  Created by Xuefan Zhang on 4/8/15.
//  Copyright (c) 2015 Xuefan Zhang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    var defaultTips = [0.18, 0.2, 0.22]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        defaultTipControl.layer.cornerRadius = 0.0
        
        defaultTipControl.layer.borderWidth = 2.0
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var defaultTipIndex = defaults.integerForKey("defaultTipIndex")
        
        var defaultTip = defaultTips[defaultTipIndex]
        
        defaultTipControl.selectedSegmentIndex = defaultTipIndex
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onValueChanged(sender: UISegmentedControl) {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(sender.selectedSegmentIndex, forKey: "defaultTipIndex")
        defaults.synchronize()
        println(defaults)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
