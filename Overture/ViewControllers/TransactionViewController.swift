//
//  TransactionViewController.swift
//  Overture
//
//  Created by Isaac Asante on 2020-11-20.
//

import UIKit


class TransactionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {


    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var filterSCOut: UISegmentedControl!
    @IBOutlet weak var orderSCOut: UISegmentedControl!
    
    
    // MARK: - Actions
    // Action for Filter Segmented Controller to sort table view using switch statement
    @IBAction func filterSC(_ sender: Any) {
        // Switch Statement to figure out what Segmented Controller option is selected
        switch filterSCOut.selectedSegmentIndex {
        case 0:
            tableArray = transactionArray
            print("case is out 0")
            tableView.reloadData()
        case 1:
            tableArray = tableArray.sorted(by: {$0.price > $1.price})
            print("case is out 1")
            tableView.reloadData()
        default:
            tableArray = transactionArray
            tableView.reloadData()

        }
    }
    
    // Action for Sort Segmented Controller to sort table view using switch statement
    @IBAction func orderSC(_ sender: Any) {
        // Switch Statement to figure out what Segmented Controller option is selected
        switch orderSCOut.selectedSegmentIndex {
        case 0:
            tableArray.reverse()
            print("case is out 0")
            tableView.reloadData()
        case 1:
            tableArray.reverse()
            tableView.reloadData()

        default:
            tableArray = transactionArray
            tableView.reloadData()
        }
    }
    
    
    // MARK: - Initialization
    var tableArray = [Transaction]()
    var searchData = [Transaction]()
    var order = Bool()

    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
              
        // Assigning specified delgates
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        self.hideKeyboard()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Reload array for table view and table view itself
        tableArray = transactionArray
        tableView.reloadData()
    }
    
    
    
    
    // MARK: - UITableView Delegate Methods
    // Method that returns number of cells for table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    // Method to assign values from array to cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as! TransactionTableViewCell
        
        let item = tableArray[indexPath.row]
        
        // Assign values from TransactionArray to table cell
        cell.transactionName.text = item.name
        cell.transactionCategory.text = item.category
        cell.transactionDate.text = item.date
        cell.transactionPrice.text = String(format: "%.2f", item.price)
        
        return cell
    }
    
    // Method that allows swiping to delete transaction from tableview and relevent arrays
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // If Statement to allow for swiping to remove from table view and array
        if editingStyle == .delete {
            tableArray.remove(at: indexPath.row)
            transactionArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            }
    }
    

    
    // MARK: - UISerachBar Delegate Methods
    // Method that detects any changes to seachbar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchBar.text else {return}
        
        // If statment to check if search bar is empty else find results from user search
        if searchText.isEmpty {
            searchData.removeAll()
            tableArray = transactionArray
            tableView.reloadData()
        } else {
            // For loop to go through each item in array and see if name or category match text searched
            for item in transactionArray {
                if (item.name == searchText || item.category == searchText) {
                    searchData.append(item)
                    print(searchData.count)
                }
            }
            // Update array with results and reload tableview
            tableArray = searchData
            self.tableView.reloadData()
        }
    }
    
    
    // Method that reloads tableview when search canceled
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tableArray = transactionArray
        tableView.reloadData()
    }
    

    

}
