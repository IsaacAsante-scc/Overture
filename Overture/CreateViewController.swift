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
    // Action to create transaction if all fields complete and add to array
    @IBAction func submitTransaction(_ sender: Any) {
        // If statement to make sure both fields are not empty
        if (transactionPrice.hasText == true && transactionName.hasText) {
            tn = String(transactionName.text!)
            tp = Double(transactionPrice.text!)
            tc = String(pickerData[catRow])
            td = dateFormatter.string(from: datePicker.date)
 
            // Calling newTransaction method to create Transaction object
            newTransaction(tName: tn!, tPrice: tp!, tCategory: tc!, tDate: td!)
            spentToday()
                        
            // Popping the top view controller from the navigation stack, updating display
            _ = navigationController?.popViewController(animated: true)
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
    let calender = Calendar.current
    let date = Date()
    
    
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = categories
        
        // Formating Date and Time Style
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        // Assigning specified delgates
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        transactionPrice.delegate = self
    }
    
    
    // MARK: - UIPickerView Delegate Methods
    // Method that gets number of columns for picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // Mehtod that gets number of rows for picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    // Method that gets data for specified row for picker view
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    // Method that gets int form selected row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        catRow = pickerView.selectedRow(inComponent: 0)
    }
    
    
    
    // MARK: - UITextField Delegate Methods
    // Method that sets values that can only be entered in UITextField
    func textField(_ textfield: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = ".1234567890"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterrSet = CharacterSet(charactersIn: string)
        
        return allowedCharacterSet.isSuperset(of: typedCharacterrSet)
    }
    
    
    
    // MARK: - Methods
    // Method that creates a new transaction object from parameters and adds it to transactionArray
    func newTransaction(tName: String, tPrice: Double, tCategory: String, tDate: String) {
        let transaction = Transaction(name: tName, category: tCategory, date: tDate, price: tPrice)
        transactionArray.append(transaction)
    }
    
    
    // Method to update amount spent today by user
    func spentToday() {
        // If Statement to make sure array is not empty
        if transactionArray.count > 0 {
            
            // Getting date from date picker and getting current date
            dateFormatter.dateFormat = "MM/dd/yy"
            let itemString = dateFormatter.string(from: datePicker.date)
            let currentDate = dateFormatter.string(from: date)

            // If Statment to compare dates and add to spentTD double if picker date match with current date
            if itemString == currentDate {
                let count = transactionArray.count - 1
                spentTD = spentTD + transactionArray[count].price
            }
        }
    }

}
