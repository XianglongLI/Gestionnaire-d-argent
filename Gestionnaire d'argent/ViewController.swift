//
//  ViewController.swift
//  Gestionnaire d'argent
//
//  Created by Julien 安 on 2019/1/1.
//  Copyright © 2019年 if26. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var monthPicker: UITextField!
    @IBOutlet weak var revenue: UILabel!
    @IBOutlet weak var depenses: UILabel!
    @IBOutlet weak var reste: UILabel!
    
    var monthStr: String? = nil
    
    fileprivate func initializeMonth() {
        // Do any additional setup after loading the view, typically from a nib.
        if monthStr == nil {
            let date = Date() // gets current date
            let calendar = Calendar.current
            let currentYear = calendar.component(.year, from: date)
            let currentMonth = calendar.component(.month, from: date)
            monthStr = String(format: "%02d/%d", currentMonth, currentYear)
        }
        self.monthPicker.text = monthStr
    }
    
    fileprivate func setupDatePicker() {
        let expiryDatePicker = MonthYearPickerView()
        monthPicker.inputView = expiryDatePicker
        expiryDatePicker.onDateSelected = { (month: Int, year: Int) in
            let string = String(format: "%02d/%d", month, year)
            self.monthPicker.text = string
            self.setValues()
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
                self.monthPicker.resignFirstResponder()
            }
        }
    }
    
    fileprivate func setValues() {
        let reve = getRevenueByMonthStr(month: monthPicker.text!)
        let depe = calculateDepensesByMonthStr(month: monthPicker.text!)
        self.revenue.text = String(format: "%.2f", reve)
        self.depenses.text = String(format: "%.2f", depe)
        self.reste.text = String(format: "%.2f", reve - depe)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeMonth()
        setupDatePicker()
        DBConnection.createTable()
        setValues()
    }
    
    @IBAction func drop() {
        DBConnection.drop()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let revenueViewController = segue.destination as? RevenueViewController {
            revenueViewController.monthStr = monthPicker.text
        }
        if let depenseViewController = segue.destination as? DepenseViewController {
            depenseViewController.monthStr = monthPicker.text
        }
    }
    
    

    
}

