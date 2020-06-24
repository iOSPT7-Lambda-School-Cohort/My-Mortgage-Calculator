//
//  MortgageQuoteTableViewController.swift
//  MyMortgage
//
//  Created by Gladymir Philippe on 6/18/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import UIKit

class MortgageQuoteTableViewController: UITableViewController {
    
    let mortgageLoanController = MortgageLoanController.mortgageLoanController
    var mortgageLoanArray: [(String, MortgageLoan)] {
        var mlArray: [(String, MortgageLoan)] = []
        for (key, value) in mortgageLoanController.mortgages {
            mlArray.append((key, value))
        }
        return mlArray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mortgageLoanArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "SavedCell", for: indexPath) as? MortgageSavedQuoteTableViewCell else { return UITableViewCell() }
       let mortgage = mortgageLoanArray[indexPath.row].1
       cell.mortgage = mortgage

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mortgage = mortgageLoanArray[indexPath.row].1
        let mortgageType = mortgage.mortgageType
        if mortgageType == "Mortgage" {
            self.performSegue(withIdentifier: "LoadSavedLoanSegue", sender: nil)
        } else if mortgageType == "ARM" {
            self.performSegue(withIdentifier: "LoadARMSegue", sender: nil)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let mortgageName = mortgageLoanArray[indexPath.row].0
            mortgageLoanController.deleteMortgageLoan(savedName: mortgageName)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
    

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "LoadSavedLoanSegue" {
            //let mortgageResultsVC = segue.destination as? MortgageResultsViewController
            guard let index = tableView.indexPathForSelectedRow?.row else { return }
            let mortgage = mortgageLoanArray[index].1
            mortgageLoanController.mortgageLoan = mortgage
        } else if segue.identifier == "LoadARMSegue" {
            guard let index = tableView.indexPathForSelectedRow?.row else { return }
            let mortgage = mortgageLoanArray[index].1
            mortgageLoanController.mortgageLoan = mortgage
        }
    }


}
