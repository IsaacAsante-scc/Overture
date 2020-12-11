//
//  BudgetViewController.swift
//  Overture
//
//  Created by Isaac Asante on 2020-11-09.
//

import Foundation
import UIKit
import Charts


class BudgetViewController: UIViewController, UITabBarControllerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var budgetForMonth: UITextField!
    @IBOutlet weak var monthBudgetRemain: UILabel!
    @IBOutlet weak var weekBudgetRemain: UILabel!
    @IBOutlet weak var dailyBudgetRemain: UILabel!
    @IBOutlet weak var spentTodayText: UITextField!
    // Category Labels
    @IBOutlet weak var householdLabel: UILabel!
    @IBOutlet weak var grocerriesLabel: UILabel!
    @IBOutlet weak var transportationLabel: UILabel!
    @IBOutlet weak var otherLabel: UILabel!
    @IBOutlet weak var utilitesLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    
    
    // MARK: - Initailization
    let categories = ["Household", "Other", "Grocerries", "Food", "Transportation", "Utilities"]

    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        populateLineChart()

        setBudgetInfo(list: transactionArray)
        budgetForMonth.text = String(format: "%.2f", setBudget)
        // Calling categorylLabel Method to set all category labels text
        categoryLabels(category: "Household", label: householdLabel)
        categoryLabels(category: "Grocerries", label: grocerriesLabel)
        categoryLabels(category: "Transportation", label: transportationLabel)
        categoryLabels(category: "Other", label: otherLabel)
        categoryLabels(category: "Utilities", label: utilitesLabel)
        categoryLabels(category: "Food", label: foodLabel)
    }
    
    
    // MARK: - Methods and Functions
    // Method to populate line chart
    func populateLineChart() {
        var entries = [ChartDataEntry]()
        var count = 1.0
        
        // For loop to create an array of entries for line chart
        for items in transactionArray {
            entries.append(ChartDataEntry(x: count, y: items.price))
            count = count + 1
        }
        
        // Creating Data Set from array
        let set = LineChartDataSet(entries: entries)
        // Creating line chart data from data set
        let data = LineChartData(dataSet: set)
        // Setting chart colors and setting data for line chart
        set.colors = ChartColorTemplates.vordiplom()
        lineChartView.data = data
    }
    
    
    // Method to calculate and set budget remaininng text labels
    func setBudgetInfo(list: [Transaction]) {
        var transactionTotal = 0.00
    
        if (setBudget > 0) {
            // For loop to get totals of each category from transactionArray
            for transaction in list {
                transactionTotal = transactionTotal + transaction.price
            }
            let output1 = (setBudget - transactionTotal)
            let output2 = (setBudget - transactionTotal) / 4
            let output3 = (setBudget - transactionTotal) / 30
            
            // Setting label text to category totals with formating for decimals
            var outputString: String = String(format: "%.2f", output1)
            monthBudgetRemain.text = outputString
            outputString = String(format: "%.2f", output2)
            weekBudgetRemain.text = outputString
            outputString = String(format: "%.2f", output3)
            dailyBudgetRemain.text = outputString

        } else {
            monthBudgetRemain.text = "0.00"
            weekBudgetRemain.text = "0.00"
            dailyBudgetRemain.text = "0.00"
        }
    }
    
    // Method to set label colour and text to amount spent in category
    func categoryLabels(category:String, label: UILabel) {
        if transactionArray.count > 0 {
            var total = 0.0
            spentTodayText.text = String(format: "%.2f", spentTD)
            // For loop to cycle through each item n array
            for item in transactionArray {
                if category == item.category {
                    total = total + item.price
                }
            }
            if total > 0.0 {
                label.textColor = UIColor.systemGreen
                label.text = String(format: "%.2f", total)
            }
        } else {
            spentTodayText.text = nil
            spentTD = 0.0
            label.text = "N/A"
            label.textColor = UIColor(named: "textColorBlack")
        }
    }
    

    
    
    
}

        

