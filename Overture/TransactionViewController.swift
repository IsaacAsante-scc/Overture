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
    @IBAction func filterSC(_ sender: Any) {
        print(filterSCOut.selectedSegmentIndex)
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
    @IBAction func orderSC(_ sender: Any) {
        print(orderSCOut.selectedSegmentIndex)

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
    
    @objc func filterTable(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            tableArray = transactionArray
        case 2:
            tableArray = tableArray.sorted(by: {$0.price > $1.price})
        default:
            tableArray = transactionArray
        }
    }
    
    
    @objc func orderTable(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            tableArray.reverse()
        default:
            tableArray = transactionArray
        }
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
