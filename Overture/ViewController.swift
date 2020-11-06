//
//  ViewController.swift
//  Overture
//
//  Created by Isaac Asante on 2020-10-06.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var budgetView: UIView!
    @IBOutlet weak var transactionView: UIView!
    
    var transactionArray = [Transaction]()
    let categories = ["Household", "Other", "Grocerries", "Food", "Transportation", "Utilities"]
    let catTotals = [98.0, 43.0, 237.0, 56.0, 45.0, 108.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        budgetView.layer.cornerRadius = 13
        transactionView.layer.cornerRadius = 13
        
        
        
        populatePieChart(dataInput: categories, values: catTotals)
        
    }
    
    func populatePieChart(dataInput: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataInput.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataInput[i], data: dataInput[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataInput.count)
        // pieChartDataSet.entryLabelColor = UIColor.white
        
        
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        
        
        pieChartView.data = pieChartData
        pieChartView.holeColor = nil
    }
    
    func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
        var colors: [UIColor] = []
        for _ in 0..<numbersOfColor {
            let red = Double(arc4random_uniform(150))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(150))
            let color = UIColor(red: CGFloat(red/149), green: CGFloat(green/255), blue: CGFloat(blue/149), alpha: 1)
            colors.append(color)
        }
        return colors
    }


}

