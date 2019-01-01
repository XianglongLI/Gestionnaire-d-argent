//
//  CategoryViewController.swift
//  Gestionnaire d'argent
//
//  Created by Julien 安 on 2019/1/1.
//  Copyright © 2019年 if26. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var message:String? = nil
    var month: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func AlimentClick() {
        message = "Aliment"
    }
    
    @IBAction func TransportClick() {
        message = "Transport"
    }
    
    @IBAction func HabitationClick() {
        message = "Habitation"
    }
    
    @IBAction func DivertissementClick() {
        message = "Divertissement"
    }
    
    @IBAction func HabillementClick() {
        message = "Habillement"
    }
    
    @IBAction func AutreClick() {
        message = "Autre"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addDepenseViewController = segue.destination as? AddDepenseViewController {
            addDepenseViewController.category = message
            addDepenseViewController.month = month
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
