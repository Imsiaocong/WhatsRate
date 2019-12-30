//
//  TodayViewController.swift
//  WhatsRateWidget
//
//  Created by Di Wang on 2016/11/14.
//  Copyright © 2016年 Di Wang. All rights reserved.
//

import UIKit
import NotificationCenter
import SwiftyJSON

class TodayViewController: UIViewController, NCWidgetProviding {  
    
    @IBOutlet weak var displayBar: UILabel!
    @IBOutlet weak var rateIndex: UILabel!
    let url_USD = "https://api.fixer.io/latest?base=USD"
    var checked: Bool = false
    var currency: Float!
    var yourAmount: Float!
    var amountArray = [Float]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        parsingJSON()
        expand()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func parsingJSON() {
        if let jsonData = NSData(contentsOf: NSURL(string: url_USD)! as URL) {
            do{
                let json = try JSON(data: jsonData as Data)
                self.rateIndex.text = String(describing: json["rates"]["CNY"])
                self.currency = json["rates"]["CNY"].float
            }catch{
                print("Warning!")
            }
        }
    }
    
    func expand() {
        self.extensionContext?.widgetLargestAvailableDisplayMode = NCWidgetDisplayMode.expanded
        self.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        
        if activeDisplayMode == NCWidgetDisplayMode.compact {
            self.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: 100);
        }else{
            self.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: 200);
        }
        
    }
    
    @IBAction func btn_1(_ sender: UIButton) {
        if checked == false {
            yourAmount = 1
            checked = true
            displayBar.text = String(yourAmount * currency)
        } else {
           yourAmount = (yourAmount * 10) + 1
            displayBar.text = String(yourAmount * currency)
        }
    }
    @IBAction func btn_2(_ sender: UIButton) {
        if checked == false {
            yourAmount = 2
            checked = true
            displayBar.text = String(yourAmount * currency)
        } else {
            yourAmount = (yourAmount * 10) + 2
            displayBar.text = String(yourAmount * currency)
        }
    }
    @IBAction func btn_3(_ sender: UIButton) {
        if checked == false {
            yourAmount = 3
            checked = true
            displayBar.text = String(yourAmount * currency)
        } else {
            yourAmount = (yourAmount * 10) + 3
            displayBar.text = String(yourAmount * currency)
        }
    }
    @IBAction func btn_4(_ sender: UIButton) {
        if checked == false {
            yourAmount = 4
            checked = true
            displayBar.text = String(yourAmount * currency)
        } else {
            yourAmount = (yourAmount * 10) + 4
            displayBar.text = String(yourAmount * currency)
        }
    }
    @IBAction func btn_5(_ sender: UIButton) {
        if checked == false {
            yourAmount = 5
            checked = true
            displayBar.text = String(yourAmount * currency)
        } else {
            yourAmount = (yourAmount * 10) + 5
            displayBar.text = String(yourAmount * currency)
        }
    }
    @IBAction func btn_6(_ sender: UIButton) {
        if checked == false {
            yourAmount = 6
            checked = true
            displayBar.text = String(yourAmount * currency)
        } else {
            yourAmount = (yourAmount * 10) + 6
            displayBar.text = String(yourAmount * currency)
        }
    }
    @IBAction func btn_7(_ sender: UIButton) {
        if checked == false {
            yourAmount = 7
            checked = true
            displayBar.text = String(yourAmount * currency)
        } else {
            yourAmount = (yourAmount * 10) + 7
            displayBar.text = String(yourAmount * currency)
        }
    }
    @IBAction func btn_8(_ sender: UIButton) {
        if checked == false {
            yourAmount = 8
            checked = true
            displayBar.text = String(yourAmount * currency)
        } else {
            yourAmount = (yourAmount * 10) + 8
            displayBar.text = String(yourAmount * currency)
        }
    }
    @IBAction func btn_9(_ sender: UIButton) {
        if checked == false {
            yourAmount = 9
            checked = true
            displayBar.text = String(yourAmount * currency)
        } else {
            yourAmount = (yourAmount * 10) + 9
            displayBar.text = String(yourAmount * currency)
        }
    }
    @IBAction func btn_0(_ sender: UIButton) {
        if checked == false {
            yourAmount = 0
            checked = true
            displayBar.text = String(yourAmount * currency)
        } else {
            yourAmount = (yourAmount * 10) + 0
            displayBar.text = String(yourAmount * currency)
        }
    }
    @IBAction func btn_c(_ sender: UIButton) {
        self.yourAmount = 0
        checked = false
        displayBar.text = "--"
    }
}

extension TodayViewController {
    
}
