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
    

    
    // MARK: - UISerachBar Delegate Methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchBar.text else {return}
        
        print(searchText)
        
        if searchText.isEmpty {
            tableArray = transactionArray
            tableView.reloadData()
        } else {
            searchData = tableArray.filter({$0.name == searchText || $0.category == searchText})
            print(searchData.count)
            tableArray = searchData
            self.tableView.reloadData()
        }
        
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tableArray = transactionArray
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
