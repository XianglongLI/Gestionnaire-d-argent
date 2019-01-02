//
//  RevenueViewController.swift
//  Gestionnaire d'argent
//
//  Created by Julien 安 on 2019/1/1.
//  Copyright © 2019年 if26. All rights reserved.
//

import UIKit

class RevenueViewController: UIViewController {
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var revenueText: UITextField!
    
    var monthStr: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        month.text = "Revenue du " + monthStr!
        revenueText.text = String(getRevenueByMonthStr(month: monthStr!))
    }

    @IBAction func modify() {
        let revenue = Double(revenueText.text!)
        let monthArr = monthStr?.components(separatedBy: "/")
        let monthInt = Int(monthArr![0])
        let yearInt = Int(monthArr![1])
        let consommation = Consommation()
        consommation.year = yearInt!
        consommation.month = monthInt!
        consommation.price = revenue!
        consommation.category = "Revenue"
        
        let existRevenue = getRevenueByMonthStr(month: monthStr!)
        if existRevenue - 0 < 0.00001 && existRevenue - 0 > -0.00001 {
            DBConnection.insert(consommation: consommation)
        } else {
            DBConnection.updateRevenue(rYear: yearInt!, rMonth: monthInt!, revenue: revenue!)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.monthStr = monthStr
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
