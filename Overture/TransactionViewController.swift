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
    let example = Transaction(name: "name", category: "cate", date: "324", price: 34.44)
    var array = ["A", "B", "C"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        transactionArray.append(example)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    
    
    
    // MARK: - UITableView Delegate Methods
    // Method that returns number of cells for table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as! TransactionTableViewCell
        
        let item = transactionArray[indexPath.row]
        
        // Assign values from TransactionArray to table cell
        cell.transactionName.text = item.name
        cell.transactionCategory.text = item.category
        cell.transactionDate.text = item.date
        cell.transactionPrice.text = String(format: "%.2f", item.price)
        
        return cell
    }
    

    
    // MARK: - UISerachBar Delegate Methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {return}
        
        if (transactionArray.contains(searchText)) {
            print()
        }
        
        if searchText == "" {
            
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
