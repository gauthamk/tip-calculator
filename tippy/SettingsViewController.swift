//
//  SettingsViewController.swift
//  tippy
//
//  Created by Gautham Krishna on 9/8/14.
//  Copyright (c) 2014 Gautham Krishna. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var themeControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("default_tip_percentage")
        themeControl.selectedSegmentIndex = defaults.integerForKey("default_theme_color")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onValueChange(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(tipControl.selectedSegmentIndex, forKey: "default_tip_percentage")
        defaults.setObject(themeControl.selectedSegmentIndex, forKey: "default_theme_color")
        defaults.synchronize()
    }
}
