//
//  MortgagePage1ViewController.swift
//  MyMortgage
//
//  Created by Gladymir Philippe on 6/20/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import UIKit

class MortgagePage1ViewController: UIViewController {
    
    private let mortgageTypes: [String] = ["Mortgage", "5/1 ARM", "Refinance"]
    var mortgageLoanController = MortgageLoanController.mortgageLoanController
    
    @IBOutlet weak var titleImage: UIImageView!
    
    @IBOutlet weak var armButton: UIButton!
    
    @IBOutlet weak var traditionalmortgageButton: UIButton!
    
    @IBOutlet weak var loanQuoteButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mortgageLoanController.loadFromPersistentStore()
       // MortgageQuoteTableViewController.loadFromPersistentStore()

        traditionalmortgageButton.layer.cornerRadius = 12
        traditionalmortgageButton.backgroundColor = .systemTeal
        armButton.layer.cornerRadius = 12
        armButton.backgroundColor = .systemTeal
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TraditionalMortgageSegue" {
            let mortgageType = "Mortgage"
            mortgageLoanController.createMortgageLoan(mortgageType: mortgageType)
            let mortgageP2VC = segue.destination as! MortgageCalculatorViewController
            mortgageP2VC.mortgageLoanController = mortgageLoanController
        } else if segue.identifier == "ARMSegue" {
            let mortgageType = "ARM"
            mortgageLoanController.createMortgageLoan(mortgageType: mortgageType)
            let armP2VC = segue.destination as! MortgageARMCalculatorViewController
            armP2VC.mortgageLoanController = mortgageLoanController
        } else if segue.identifier == "LoanQuote" {
            let quote = segue.destination as! MortgageQuoteTableViewController
            //quote.mortgageLoanController = mortgageLoanController
        }
    }
    
    @IBAction func unwindToHome(sender: UIStoryboardSegue) {
        mortgageLoanController.mortgageLoan = nil
    }

}
