//
//  ViewController.swift
//  Overture
//
//  Created by Isaac Asante on 2020-10-06.
//

import UIKit
import Charts


// MARK: - Global Variables Initilaization
public var setBudget = 0.0
public var transactionArray = [Transaction]()
public var categories = ["Household", "Other", "Grocerries", "Food", "Transportation", "Utilities"]
public var budgetDate = Date()
public var spentTD = 0.0


class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var budgetView: UIView!
    @IBOutlet weak var transactionView: UIView!
    @IBOutlet weak var monthBudget: UITextField!
    @IBOutlet weak var weekBudget: UITextField!
    @IBOutlet weak var dayBudget: UITextField!
    // Latest Transaction Outlets
    @IBOutlet weak var latePrice: UITextField!
    @IBOutlet weak var lateName: UILabel!
    @IBOutlet weak var lateCategory: UILabel!
    @IBOutlet weak var lateDate: UILabel!
    
    
    
    
    
    
    // MARK: - Initailization
    var catTotals = [Double]()
    
    
    // MARK: - Overide Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: - View Appereance
        budgetView.layer.cornerRadius = 13
        transactionView.layer.cornerRadius = 13
       
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        catTotals = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        pieChartView.clear()
        
        catTotals(tranArray: transactionArray)
        // Running method populate pie chart
        populatePieChart(dataInput: categories, values: catTotals)
        budgetPreview()
        latestTransaction()
        
    }
    
    
    
    
    
    
    
    
    // MARK: - Methods and Functions
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
        pieChartData.setValueTextColor(NSUIColor.clear)
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
    
    func budgetPreview() {
        let value = setBudget
        if setBudget > 0.0 {
            monthBudget.text = String(format: "%.2f", value)
            weekBudget.text = String(format: "%.2f", value/4)
            dayBudget.text = String(format: "%.2f", value/30)
        }
    }
    
    func latestTransaction() {
        print("Array count", transactionArray.count)
            if (transactionArray.count > 0) {
                let latestNum = transactionArray.count - 1
                lateName.text = transactionArray[latestNum].name
                lateCategory.text = transactionArray[latestNum].category
                lateDate.text = transactionArray[latestNum].date
                latePrice.text = String(format: "%.2f", transactionArray[latestNum].price)
            } else {
                lateName.text = "N/A"
                lateCategory.text = "N/A"
                lateDate.text = "N/A"
                latePrice.text = "N/A"
            }
        
    }
    
    
    
    func catTotals(tranArray: [Transaction]) {
        for item in transactionArray {
            switch item.category {
            case "Household":
                catTotals[0] = catTotals[0] + item.price
            case "Other":
                catTotals[1] = catTotals[1] + item.price
            case "Grocerries":
                catTotals[2] = catTotals[2] + item.price
            case "Food":
                catTotals[3] = catTotals[3] + item.price
            case "Transportation":
                catTotals[4] = catTotals[4] + item.price
            case "Utilities":
                catTotals[5] = catTotals[5] + item.price
            default:
                print("An item has escaped the switch" + item.name)
            }
        }
    }



}

