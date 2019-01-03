//
//  DBConnection.swift
//  Gestionnaire d'argent
//
//  Created by Julien 安 on 2019/1/2.
//  Copyright © 2019年 if26. All rights reserved.
//

import SQLite

class DBConnection {
    
    static let table = Table("consommation")
    static let id = Expression<Int>("id")
    static let year = Expression<Int>("year")
    static let month = Expression<Int>("month")
    static let day = Expression<Int>("day")
    static let category = Expression<String>("category")
    static let description = Expression<String>("description")
    static let price = Expression<Double>("price")
    
    static var database: Connection! = DBConnection.initConnection()
    
    static func initConnection() -> Connection {
        var connection: Connection? = nil
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do {
            connection = try Connection("\(path)/db.sqlite3")
        } catch {
            print(error)
        }
        return connection!
    }
    
    static func createTable() {
        let createTable = table.create(ifNotExists: true) { table in
            table.column(id, primaryKey: .autoincrement)
            table.column(year)
            table.column(month)
            table.column(day)
            table.column(category)
            table.column(description)
            table.column(price)
        }
        do {
            try DBConnection.database.run(createTable)
        } catch {
            print(error)
        }
    }
    
    static func insert(consommation: Consommation) {
        let insert = table.insert(year <- consommation.year, month <- consommation.month, day <- consommation.day, category <- consommation.category, description <- consommation.description, price <- consommation.price)
        do {
            try DBConnection.database.run(insert)
        } catch {
            print(error)
        }
    }
    
    static func getRevenue(rYear: Int, rMonth: Int) -> Double {
        var revenue: Double = 0
        let query = table.select(price)
            .filter(year == rYear)
            .filter(month == rMonth)
            .filter(category == "Revenue")
        do {
            for revenues in try DBConnection.database.prepare(query) {
                revenue = revenues[price]
            }
            
        } catch {
            print(error)
        }
        return revenue
    }
    
    static func updateRevenue(rYear: Int, rMonth: Int, revenue: Double) {
        let reve = table.filter(year == rYear).filter(month == rMonth).filter(category == "Revenue")
        do {
            try DBConnection.database.run(reve.update(price <- revenue))
        } catch {
            print(error)
        }
    }
    
    static func getDepenses(dYear: Int, dMonth: Int) -> [Consommation] {
        var depenses: [Consommation] = []
        let query = table.select(id, year, month, day, category, description, price)
            .filter(year == dYear)
            .filter(month == dMonth)
            .filter(category != "Revenue")
            .order(day.desc)
        do {
            for depense in try DBConnection.database.prepare(query) {
                let consommation = Consommation()
                consommation.id = depense[id]
                consommation.year = depense[year]
                consommation.month = depense[month]
                consommation.day = depense[day]
                consommation.category = depense[category]
                consommation.description = depense[description]
                consommation.price = depense[price]
                depenses.append(consommation)
            }
        } catch {
            print(error)
        }
        return depenses
    }
    
    static func deleteDepenseById(dId: Int) {
        let depense = table.filter(id == dId)
        do {
            try DBConnection.database.run(depense.delete())
        } catch {
            print("delete failed: \(error)")
        }
    }
    
    static func drop() {
        do {
            try DBConnection.database.run(table.drop())
        } catch {
            print(error)
        }
        DBConnection.createTable()
    }
    
}
