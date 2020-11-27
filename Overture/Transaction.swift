//
//  Transaction.swift
//  Overture
//
//  Created by Isaac Asante on 2020-10-18.
//

import Foundation



// MARK: - Transaction Class
public class Transaction: NSObject {
    // Defining class
    var name: String
    var category: String
    var date: String
    var price: Double
    
    // Initilizers
    init(name:String, category: String, date: String, price: Double) {
        self.name = name
        self.category = category
        self.date = date
        self.price = price
    }
}
