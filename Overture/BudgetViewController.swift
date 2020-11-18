//
//  BudgetViewController.swift
//  Overture
//
//  Created by Isaac Asante on 2020-11-09.
//

import Foundation
import UIKit
import Charts


class BudgetViewController: UIViewController {
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    var transactionArray = [Transaction]()
    let categories = ["Household", "Other", "Grocerries", "Food", "Transportation", "Utilities"]
    // let dates = []
    let catTotals = [98.0, 43.0, 237.0, 56.0, 45.0, 108.0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // populateLineChart(dataInput: categories, values: catTotals)
        // setChartValues()

    }
    
    
    func setChartValues(count: Int = 20) {
        // let values = (0..<count).map { (i) -> ChartDataEntry in
        //    let val = Double(arc4random_uniform(UInt32(count))+ 3))
        }
    }
    
    func populateLineChart(dataInput: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataInput.count {
          let dataEntry = ChartDataEntry(x: values[i], y: Double(i))
          dataEntries.append(dataEntry)
        }
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: nil)
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        // lineChartView.data = lineChartData
    }
        

