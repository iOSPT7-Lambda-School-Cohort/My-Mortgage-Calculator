//
//  MortgageSavedQuoteTableViewCell.swift
//  MyMortgage
//
//  Created by Gladymir Philippe on 6/18/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import UIKit

class MortgageSavedQuoteTableViewCell: UITableViewCell {

    var mortgage: MortgageLoan? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var saveQuoteLabel: UILabel!
    
    
    func updateViews() {
        guard let mortgage = mortgage, let saveQuoteName = mortgage.savedName else { return }
        saveQuoteLabel.text = saveQuoteName
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
