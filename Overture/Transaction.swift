//
//  Transaction.swift
//  Overture
//
//  Created by Isaac Asante on 2020-10-18.
//

import Foundation

enum Category {
    case household
    case groceries
    case transportation
    case food
    case others
}

class Transaction: NSObject {
    var name: String = ""
    var category: Category
    var date = Date()
    var price: Double
    
    init(name:String, category: Category, date: Date, price: Double) {
        self.name = name
        self.category = category
        self.date = date
        self.price = price
    }
}
