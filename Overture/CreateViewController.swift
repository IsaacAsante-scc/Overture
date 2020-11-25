//
//  CreateViewController.swift
//  Overture
//
//  Created by Isaac Asante on 2020-11-19.
//

import UIKit

class CreateViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - Outlets
    @IBOutlet weak var transactionName: UITextField!
    @IBOutlet weak var transactionPrice: UITextField!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - Actions
    @IBAction func submitTransaction(_ sender: Any) {
        if (transactionPrice.hasText == true && transactionName.hasText) {
            tn = String(transactionName.text!)
            tp = Double(transactionPrice.text!)
            tc = String(pickerData[catRow])
            td = dateFormatter.string(from: datePicker.date)

            newTransaction(tName: tn!, tPrice: tp!, tCategory: tc!, tDate: td!)
        }
    }
    
    // MARK: - Initailazation
    var pickerData:[String] = [String]()
    var catRow = Int()
    var dateFormatter = DateFormatter()
    var tn:String?
    var tp:Double?
    var tc:String?
    var td: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = categories
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        
        // Connecting Data to specifed delagate
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        transactionPrice.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - UIPickerViewDelegate
    // Method that gets number of columns for picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // Mehtod that gets number of rows for picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    // Method that gets data for specife row for picker view
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        catRow = pickerView.selectedRow(inComponent: 0)
    }
    
    
    // MARK: - Methods
    // Method that creates a new transaction  object and adds it to transactionArray
    func newTransaction(tName: String, tPrice: Double, tCategory: String, tDate: String) {
        let transaction = Transaction(name: tName, category: tCategory, date: tDate, price: tPrice)
        transactionArray.append(transaction)
        print(transaction.date)
        print(transactionArray.count)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
