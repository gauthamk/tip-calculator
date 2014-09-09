//
//  ViewController.swift
//  tippy
//
//  Created by Gautham Krishna on 9/2/14.
//  Copyright (c) 2014 Gautham Krishna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateUI()
        updateValues()
        
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateValues() {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var bill = NSString(string:billField.text).doubleValue
        
        var tip = bill * tipPercentage
        var total = bill + tip
        
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
    }
    
    func updateUI() {
        var defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("default_tip_percentage")
        
        var themeValue = defaults.integerForKey("default_theme_color")
        println(themeValue)
        
        if(themeValue == 0) {
            view.backgroundColor = UIColor.redColor()
        }
        else if (themeValue == 1) {
            view.backgroundColor = UIColor.blueColor()
        }
        else if (themeValue == 2) {
            view.backgroundColor = UIColor.whiteColor()
        }
    }
    
    @IBAction func onEditChanged(sender: AnyObject) {
        updateValues();
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}
