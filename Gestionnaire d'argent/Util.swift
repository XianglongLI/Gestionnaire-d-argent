//
//  Util.swift
//  Gestionnaire d'argent
//
//  Created by Julien 安 on 2019/1/2.
//  Copyright © 2019年 if26. All rights reserved.
//

import Foundation

func getRevenueByMonthStr(month: String) -> Double {
    let monthArr = month.components(separatedBy: "/")
    let monthInt = Int(monthArr[0])
    let yearInt = Int(monthArr[1])
    return DBConnection.getRevenue(rYear: yearInt!, rMonth: monthInt!)
}

func calculateDepensesByMonthStr(month: String) -> Double {
    let monthArr = month.components(separatedBy: "/")
    let monthInt = Int(monthArr[0])
    let yearInt = Int(monthArr[1])
    let depenses = DBConnection.getDepenses(dYear: yearInt!, dMonth: monthInt!)
    var sum: Double = 0
    for depense in depenses {
        sum += depense.price
    }
    return sum
}
