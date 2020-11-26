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
    
    
    // MARK: - Initialization
    var tableArray = [Transaction]()
    var searchData = [Transaction]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableArray = transactionArray
        tableArray.reverse()
        
        tableView.reloadData()
    }
    
    
    
    
    // MARK: - UITableView Delegate Methods
    // Method that returns number of cells for table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
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
        if editingStyle == .delete {
            tableArray.remove(at: indexPath.row)
            print(tableArray.count)
            transactionArray.remove(at: indexPath.row)
            print(transactionArray.count)
            tableView.deleteRows(at: [indexPath], with: .fade)
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            }
    }
    

    
    // MARK: - UISerachBar Delegate Methods
    // Method that detects any changes to seachbar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchBar.text else {return}
        print(searchText)
        
        // If statment to check if search bar is empty else find results from search
        if searchText.isEmpty {
            searchData.removeAll()
            tableArray = transactionArray
            tableView.reloadData()
        } else {
            for item in transactionArray {
                if (item.name == searchText || item.category == searchText) {
                    searchData.append(item)
                    print(searchData.count)
                }
            }
            tableArray = searchData
            self.tableView.reloadData()
        }
        
    }
    
    // Method that reloads tableview when search canceled
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tableArray = transactionArray
        tableView.reloadData()
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
