//
//  MortgageARMResultsViewController.swift
//  MyMortgage
//
//  Created by Gladymir Philippe on 6/18/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import UIKit
import Charts

class MortgageARMResultsViewController: UIViewController {
    
    var mortgageLoanController = MortgageLoanController.mortgageLoanController
    var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter
    }
    
    @IBOutlet weak var initialRatePieChart: UIView!
    @IBOutlet weak var maxRatePieChart: PieChartView!
    @IBOutlet weak var savedNameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func saveQuote(_ sender: Any) {
        guard let name = savedNameTextField.text else { return }
        mortgageLoanController.saveMortgageLoan(savedName: name)
        let alert = UIAlertController(title: "Success!", message: "Your quote \"\(name)\" has been saved.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pieChartUpdate()
        // Do any additional setup after loading the view.
        saveButton.layer.cornerRadius = 12
        saveButton.backgroundColor = UIColor(red:0.00, green:0.51, blue:0.33, alpha:1.0)
    }
    
    func pieChartUpdate() {
        
        let principleValue = mortgageLoanController.calculateMonthlyPrinciple()
        let interestValue = mortgageLoanController.calculateMonthlyInterest()
        let interestValueAtMax = mortgageLoanController.calculateInterestAtMax()
        let insuranceValue = mortgageLoanController.calculateMonthlyInsurance()
        let propertyTaxValue = mortgageLoanController.calculateMonthlyTax()
        let hoaValue = mortgageLoanController.calculateMonthlyHOA()
        let totalInitialPayment = principleValue + interestValue + insuranceValue + propertyTaxValue + hoaValue
        let totalPaymentAtMax = principleValue + interestValueAtMax + insuranceValue + propertyTaxValue + hoaValue
        
    
        // Set up pie chart data set
        let principle = PieChartDataEntry(value: principleValue, label: "Principle")
        let interest = PieChartDataEntry(value: interestValue, label: "Interest")
        let insurance = PieChartDataEntry(value: insuranceValue, label: "Home Insurance")
        let propertyTax = PieChartDataEntry(value: propertyTaxValue, label: "Property Tax")
        let hoa = PieChartDataEntry(value: hoaValue, label: "HOA payment")
        
        let interestAtMax = PieChartDataEntry(value: interestValueAtMax, label: "Interest")
        
        let dataSet = PieChartDataSet(entries: [principle, interest, insurance, propertyTax, hoa], label: "Payment Breakdown For Initial Period")
        let dataSetAtMax = PieChartDataSet(entries: [principle, interestAtMax, insurance, propertyTax, hoa], label: "Payment BreakDown At Max Interest Rate")
        let data = PieChartData(dataSet: dataSet)
        let dataAtMax = PieChartData(dataSet: dataSetAtMax)
    
        // Set up text format
        dataSet.valueColors = [UIColor.black]
        let formatter = DefaultValueFormatter(formatter: currencyFormatter)
        dataSet.valueFormatter = .some(formatter)
        dataSetAtMax.valueColors = [UIColor.black]
        dataSetAtMax.valueFormatter = .some(formatter)
    
        // Display pie chart
        
    }

}
