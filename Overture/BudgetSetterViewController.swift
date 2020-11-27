//
//  BudgetSetterViewController.swift
//  Overture
//
//  Created by Isaac Asante on 2020-11-19.
//

import UIKit

class BudgetSetterViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var dailyLabel: UILabel!
    @IBOutlet weak var weeklyLabel: UILabel!
    @IBOutlet weak var budgetAmount: UITextField!
    
    
    
    // MARK: - Actions
    // Action that will submit budget if textfield is not empty
    @IBAction func submitBudget(_ sender: Any) {
        if (budgetAmount.hasText == true) {
            let numberConv :Double? = Double(budgetAmount.text!)
            setBudget = numberConv!
            _ = navigationController?.popViewController(animated: true)
        } else {
            // Alert if unable to create budget
            budgetAlert(title: "Failure", message: "Error - Budget could not be set Please Try Agian")
        }
    }
    
    
    // Action to update labels to preview budget for week and day
    @IBAction func previewBudget(_ sender: Any) {
        if (budgetAmount.hasText == true) {
            var numberConvDaily:Double? = Double(budgetAmount.text!)
            numberConvDaily = numberConvDaily! / 30
            var numberConvWeekly:Double? = Double(budgetAmount.text!)
            numberConvWeekly = numberConvWeekly! / 4
            dailyLabel.text = String(format: "%.2f", numberConvDaily!)
            weeklyLabel.text = String(format: "%.2f", numberConvWeekly!)
        } else {
            // Alert if unable to create budget
            budgetAlert(title: "Error", message: "Error could not display budget preview Please Try Agian")
        }
    }
    
    
    // Action to reset budget an notify the user with alert
    @IBAction func resetBudget(_ sender: Any) {
        setBudget = 0.0
        budgetAlert(title: "Reset Complete", message: "Budget has been reset")
    }
    
    
    
    
    
    
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        budgetAmount.delegate = self
    }
    
    
    // MARK: - Methods and Functions
    // Method that takes in two string elements and creates an alert with string elements
    func budgetAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

            self.present(alertController, animated: true, completion: nil)
    }
        
    

    // MARK: - UITextField Delegate Methods
    // Method that sets defined values that can only be entered in UITextField
    func textField(_ textfield: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = ".1234567890"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterrSet = CharacterSet(charactersIn: string)
        
        return allowedCharacterSet.isSuperset(of: typedCharacterrSet)
    }
    
    
    


}
