//
//  ConnectionViewController.swift
//  Gestionnaire d'argent
//
//  Created by Julien 安 on 2019/1/14.
//  Copyright © 2019年 if26. All rights reserved.
//

import UIKit

class ConnectionViewController: UIViewController {
    @IBOutlet weak var alert: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func skip() {
        alert.text = "Veuillez saisir votre code de connection"
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
