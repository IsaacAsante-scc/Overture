//
//  Transaction.swift
//  Overture
//
//  Created by Isaac Asante on 2020-10-18.
//

import Foundation

/*
enum Category {
    case household
    case groceries
    case transportation
    case food
    case others
}
 */

public class Transaction: NSObject {
    var name: String
    var category: String
    var date: String
    var price: Double
    
    init(name:String, category: String, date: String, price: Double) {
        self.name = name
        self.category = category
        self.date = date
        self.price = price
    }
}
