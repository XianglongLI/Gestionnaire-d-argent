//
//  AddDepenseViewController.swift
//  Gestionnaire d'argent
//
//  Created by Julien 安 on 2019/1/1.
//  Copyright © 2019年 if26. All rights reserved.
//

import UIKit

class AddDepenseViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var day: UITextField!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var price: UITextField!
    
    var category: String? = nil
    var month: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myLabel.text = category
        monthLabel.text = "/" + month!
    }
    
    @IBAction func addConsommation() {
        let monthArr = month?.components(separatedBy: "/")
        let monthInt = Int(monthArr![0])
        let yearInt = Int(monthArr![1])
        let consommation = Consommation()
        consommation.year = yearInt!
        consommation.month = monthInt!
        consommation.day = Int(day.text!)!
        consommation.category = category!
        consommation.description = desc.text!
        consommation.price = Double(price.text!)!
        DBConnection.insert(consommation: consommation)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.monthStr = month
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
