//
//  ViewController.swift
//  tippy
//
//  Created by angela ong on 3/1/17.
//  Copyright © 2017 angela ong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
        billField.text = String.init(format: "%0.2f", defaults.double(forKey: "billSaved"))
        self.calculateTip()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   /* @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }*/

    @IBAction func calculateTip() {
        let bill = Double(billField.text!) ?? 0
        //return 0 default value if input is no good
        defaults.set(bill, forKey: "billSaved")
        
        let defaultTip = defaults.double(forKey: "tipSaved")
        var tip = bill * defaultTip
        var total = bill + tip
        
        if ( defaults.bool(forKey: "lowDollar") && Double(Int(total)) - bill > 0 ) {
            tip = Double(Int(total)) - bill
            total = Double(Int(total))
        }
        else if ( defaults.bool(forKey: "highDollar") && floor(total) != total ) {
            total = Double(Int(total) + 1)
            tip = total - bill
        }
        
        tipPercentLabel.text = String.init(format: "Tip   (%0.4g%%)", bill > 0 ? (tip / bill)*100 : 0)
        tipLabel.text = String.init(format: "$%.2f", tip)
        totalLabel.text = String.init(format: "$%.2f", total)
    
    }
}

