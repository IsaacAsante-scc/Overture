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
    
    
    @IBAction func submitBudget(_ sender: Any) {
        if (budgetAmount.hasText == true) {
            let numberConv :Double? = Double(budgetAmount.text!)
            setBudget = numberConv!
            print(setBudget)
            budgetAlert(title: "Sucsess", message: "Budget was sucsessfully set")
            
        } else {
            print(setBudget)
            budgetAlert(title: "Failure", message: "Error - Budget could not be set")
        }
    }
    @IBAction func previewBudget(_ sender: Any) {
        if (budgetAmount.hasText == true) {
            var numberConvDaily:Double? = Double(budgetAmount.text!)
            numberConvDaily = numberConvDaily! / 30
            var numberConvWeekly:Double? = Double(budgetAmount.text!)
            numberConvWeekly = numberConvWeekly! / 4
            dailyLabel.text = String(format: "%.2f", numberConvDaily!)
            weeklyLabel.text = String(format: "%.2f", numberConvWeekly!)
        } else {
            budgetAlert(title: "Error", message: "Error could not display budget preview")
        }
    }
    
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
        
    

    // MARK: - UITextFieldDelegate
    // Method that sets values that can be entered in UITextField
    func textField(_ textfield: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = ".1234567890"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterrSet = CharacterSet(charactersIn: string)
        
        return allowedCharacterSet.isSuperset(of: typedCharacterrSet)
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
