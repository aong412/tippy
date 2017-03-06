//
//  SettingsViewController.swift
//  tippy
//
//  Created by angela ong on 3/2/17.
//  Copyright © 2017 angela ong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let defaults = UserDefaults.standard
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var highDollarSwitch: UISwitch!
    @IBOutlet weak var lowDollarSwitch: UISwitch!
    @IBOutlet weak var defaultTipText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipText.becomeFirstResponder()
        self.formatDefault()
        
        if defaults.double(forKey: "tipSaved") == 0 {
            tipControl.selectedSegmentIndex = 2
        }
        else {
            tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipControlIndex")
        }
        lowDollarSwitch.setOn(defaults.bool(forKey: "lowDollar"), animated: false)
        highDollarSwitch.setOn(defaults.bool(forKey: "highDollar"), animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func formatDefault() {
        defaultTipText.text = String.init(format: "%g", defaults.double(forKey: "tipSaved")*100)
    }
    
    @IBAction func pressLowDollarSwitch(_ sender: UISwitch) {
        if lowDollarSwitch.isOn {
            highDollarSwitch.setOn(false, animated: true)
            defaults.set(false, forKey: "highDollar")
            defaults.set(true, forKey: "lowDollar")
        }
        else {
            defaults.set(false, forKey: "lowDollar")
        }
        
    }
    
    @IBAction func pressHighDollarSwitch(_ sender: UISwitch) {
        if highDollarSwitch.isOn {
            lowDollarSwitch.setOn(false, animated: true)
            defaults.set(false, forKey: "lowDollar")
            defaults.set(true, forKey: "highDollar")
        }
        else {
            defaults.set(false, forKey: "highDollar")
        }
        
    }
    
    @IBAction func customTipEdit(_ sender: UITextField) {
        let customInput = Double(defaultTipText.text!) ?? 0
        defaults.set(customInput / 100, forKey: "tipSaved")
        defaults.set(2, forKey: "tipControlIndex")
        tipControl.selectedSegmentIndex = 2
    }
    
    @IBAction func changeDefault(_ sender: UISegmentedControl) {
        let tipPercentages = [0.15, 0.2]
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tipControlIndex")
        
        if tipControl.selectedSegmentIndex < 2 {
            defaults.set(tipPercentages[tipControl.selectedSegmentIndex], forKey: "tipSaved")
            self.formatDefault()
        }
        else {
            defaultTipText.becomeFirstResponder()
        }
    }

    /*@IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }*/
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
