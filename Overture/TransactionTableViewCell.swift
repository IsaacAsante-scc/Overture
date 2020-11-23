//
//  transactionTableViewCell.swift
//  Overture
//
//  Created by Isaac Asante on 2020-11-22.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var transactionName: UILabel!
    @IBOutlet weak var transactionCategory: UILabel!
    @IBOutlet weak var transactionDate: UILabel!
    @IBOutlet weak var transactionPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
