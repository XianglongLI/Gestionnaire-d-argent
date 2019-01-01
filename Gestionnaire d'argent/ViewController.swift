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
    
    fileprivate func initializeMonth() {
        // Do any additional setup after loading the view, typically from a nib.
        let date = Date() // gets current date
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: date)
        let currentMonth = calendar.component(.month, from: date)
        let monthStr = String(format: "%02d/%d", currentMonth, currentYear)
        self.monthPicker.text = monthStr
    }
    
    fileprivate func setupDatePicker() {
        let expiryDatePicker = MonthYearPickerView()
        monthPicker.inputView = expiryDatePicker
        expiryDatePicker.onDateSelected = { (month: Int, year: Int) in
            let string = String(format: "%02d/%d", month, year)
            self.monthPicker.text = string
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
                self.monthPicker.resignFirstResponder()
            }
            NSLog(string)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeMonth()
        setupDatePicker()
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

