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
    // Category Labels
    @IBOutlet weak var householdLabel: UILabel!
    @IBOutlet weak var grocerriesLabel: UILabel!
    @IBOutlet weak var transportationLabel: UILabel!
    @IBOutlet weak var otherLabel: UILabel!
    @IBOutlet weak var utilitesLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    
    
    // MARK: - Initailization
    // var transactionArray = [Transaction]()
    let categories = ["Household", "Other", "Grocerries", "Food", "Transportation", "Utilities"]
    // let dates = []
    let catTotals = [98.0, 43.0, 237.0, 56.0, 45.0, 108.0]
    
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // populateLineChart(dataInput: categories, values: catTotals)
        // setChartValues()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setBudgetInfo(list: transactionArray)
        budgetForMonth.text = String(format: "%.2f", setBudget)
        categoryLabels(category: "Household", label: householdLabel)
        categoryLabels(category: "Grocerries", label: grocerriesLabel)
        categoryLabels(category: "Transportation", label: transportationLabel)
        categoryLabels(category: "Other", label: otherLabel)
        categoryLabels(category: "Utilities", label: utilitesLabel)
        categoryLabels(category: "Food", label: foodLabel)
    }
    
    
    // MARK: - Methods and Functions
    func setChartValues(count: Int = 20) {
        // let values = (0..<count).map { (i) -> ChartDataEntry in
        //    let val = Double(arc4random_uniform(UInt32(count))+ 3))
        }
    
    
    func populateLineChart(dataInput: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataInput.count {
          let dataEntry = ChartDataEntry(x: values[i], y: Double(i))
          dataEntries.append(dataEntry)
        }
        // let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: nil)
        // let lineChartData = LineChartData(dataSet: lineChartDataSet)
        // lineChartView.data = lineChartData
    }
    
    
    // Method to calculate and set budget remaing text labels
    func setBudgetInfo(list: [Transaction]) {
        var transactionTotal = 0.00
    
        if (setBudget > 0) {
            for transaction in list {
                transactionTotal = transactionTotal + transaction.price
            }
            let output1 = (setBudget - transactionTotal)
            let output2 = (setBudget - transactionTotal) / 4
            let output3 = (setBudget - transactionTotal) / 30
            
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
    
    // Method to set label to amount spent in category
    func categoryLabels(category:String, label: UILabel) {
        var total = 0.0
        for item in transactionArray {
            if category == item.category {
                total = total + item.price
            }
        }
        if total > 0.0 {
            label.textColor = UIColor.systemGreen
            label.text = String(format: "%.2f", total)
        }
    }

}

        

