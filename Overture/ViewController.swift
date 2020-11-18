//
//  ViewController.swift
//  Overture
//
//  Created by Isaac Asante on 2020-10-06.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var budgetView: UIView!
    @IBOutlet weak var transactionView: UIView!
    
    // MARK: - Initailization
    var transactionArray = [Transaction]()
    let categories = ["Household", "Other", "Grocerries", "Food", "Transportation", "Utilities"]
    let catTotals = [98.0, 43.0, 237.0, 56.0, 45.0, 108.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: - View Appereance
        budgetView.layer.cornerRadius = 13
        transactionView.layer.cornerRadius = 13
        
        
        // Running method populate pie chart
        populatePieChart(dataInput: categories, values: catTotals)
        
    }
    
    // MARK: - Methods
    // Method that takes an array of strings and double to populate and label chart
    func populatePieChart(dataInput: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        
        // Creating and array of entires for piechart
        for i in 0..<dataInput.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataInput[i], data: dataInput[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataInput.count)
        
        
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        
        // Assigning data to piechart and editing pie chart apperance
        pieChartView.data = pieChartData
        pieChartView.holeColor = nil
        pieChartView.legend.textColor = UIColor.white
    }
    
    // Method that takes integer and creates an array based on integer of random colors.
    func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
        var colors: [UIColor] = []
        for _ in 0..<numbersOfColor {
            let red = Double(arc4random_uniform(101))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(198))
            let color = UIColor(red: CGFloat(red/100), green: CGFloat(green/255), blue: CGFloat(blue/197), alpha: 1)
            colors.append(color)
        }
        return colors
    }


}

