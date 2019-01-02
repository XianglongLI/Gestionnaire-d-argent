//
//  Consommation.swift
//  Gestionnaire d'argent
//
//  Created by Julien 安 on 2019/1/2.
//  Copyright © 2019年 if26. All rights reserved.
//

import Foundation

public class Consommation  {
    var id: Int
    var year: Int
    var month: Int
    var day: Int
    var category: String
    var description: String
    var price: Double
    
    init() {
        id = 0
        year = 0
        month = 0
        day = 0
        category = ""
        description = ""
        price = 0
    }
    
}
