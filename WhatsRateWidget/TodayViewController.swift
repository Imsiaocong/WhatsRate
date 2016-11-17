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
    
    @IBOutlet weak var rateIndex: UILabel!
    let url_USD = "https://api.fixer.io/latest?base=USD"
    var currency: Float!
    var yourAmount: Float!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        parsingJSON()
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
        if let jsonData = NSData(contentsOf: NSURL(string: url_USD) as! URL) {
            let json = JSON(data: jsonData as Data)
            self.rateIndex.text = String(describing: json["rates"]["CNY"])
            self.currency = json["rates"]["CNY"].float
        }
    }
    
}
