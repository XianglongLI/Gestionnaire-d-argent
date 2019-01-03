//
//  DepenseViewController.swift
//  Gestionnaire d'argent
//
//  Created by Julien 安 on 2019/1/1.
//  Copyright © 2019年 if26. All rights reserved.
//

import UIKit

class DepenseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var month: UILabel!
    
    var monthStr: String? = nil
    var consommations: [Consommation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        month.text = "Dépenses du " + monthStr!
        let monthArr = monthStr?.components(separatedBy: "/")
        let monthInt = Int(monthArr![0])
        let yearInt = Int(monthArr![1])
        consommations = DBConnection.getDepenses(dYear: yearInt!, dMonth: monthInt!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let categoryViewController = segue.destination as? CategoryViewController {
            categoryViewController.month = monthStr
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return consommations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepenseCell", for: indexPath) as! DepenseTableViewCell
        for (index, consommation) in consommations.enumerated() {
            if index == indexPath.row {
                cell.month.text = String(format: "%02d/%02d", consommation.day, consommation.month)
                cell.category.text = consommation.category
                cell.desc.text = consommation.description
                cell.price.text = String(consommation.price)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DBConnection.deleteDepenseById(dId: consommations[indexPath.row].id)
            self.consommations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
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
