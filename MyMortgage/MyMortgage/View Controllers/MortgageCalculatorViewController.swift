//
//  MortgageCalculatorViewController.swift
//  MyMortgage
//
//  Created by Gladymir Philippe on 6/18/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import UIKit

class MortgageCalculatorViewController: UIViewController {
    
    var mortgageLoanController = MortgageLoanController.mortgageLoanController
    
    lazy private var mortgageLengthData: [[String]] = {
        let loanLength: [String] = ["15 Years", "20 Years", "30 Years", "40 Years"]
        let data: [[String]] = [["Length"], loanLength]
        return data
    }()
    
    var mortgageLength: Int? = 15
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loanAmountTextField: UITextField!
    @IBOutlet weak var interestRateTextField: UITextField!
    @IBOutlet weak var downPaymentTextField: UITextField!
    @IBOutlet weak var monthlyHOATextField: UITextField!
    @IBOutlet weak var yearlyHomeInsuranceTextField: UITextField!
    @IBOutlet weak var yearlyPropertyTaxTextField: UITextField!
    @IBOutlet weak var mortgageLengthPickerView: UIPickerView!
    @IBOutlet weak var calculateMortgageButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // addAccessoryView()
        
        mortgageLengthPickerView.delegate = self
        mortgageLengthPickerView.dataSource = self
        
        guard let mortgageLoan = mortgageLoanController.mortgageLoan else { return }
        title = "\(mortgageLoan.mortgageType)"
        
        calculateMortgageButton.layer.cornerRadius = 12
        calculateMortgageButton.backgroundColor = .systemTeal
        
        mortgageLengthPickerView.selectRow(0, inComponent: 1, animated: true)
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        getInputs()
        
    }
    
    
    func getInputs() {
        
        let loanAmount = getLoanAmount()
        let interestRate = getInterestRate()
        let downPayment = getDownPayment()
        let mortgageLength = getMortgageLength()
        
        let monthlyHOASTring = monthlyHOATextField.text ?? "0.0"
        let monthlyHOA = Double(monthlyHOASTring) ?? 0.0
        
        let homeInsuranceString = yearlyHomeInsuranceTextField.text ?? "0.0"
        let homeInsurance = Double(homeInsuranceString) ?? 0.0
        
        let propertyTaxString = yearlyPropertyTaxTextField.text ?? "0.0"
        let propertyTax = Double(propertyTaxString) ?? 0.0
        
        
        mortgageLoanController.updateMortgageLoan(mortgageLoan: mortgageLoanController.mortgageLoan!, amount: loanAmount, downPayment: downPayment, interestRate: interestRate, mortgageLength: mortgageLength, monthlyHOA: monthlyHOA, homeInsurance: homeInsurance, propertyTax: propertyTax)
        
    }
    
    func getLoanAmount() -> Double {
        guard let loanAmountString = loanAmountTextField.text,
            !loanAmountString.isEmpty else { return 0.0 }
        guard let loanAmount = Double(loanAmountString) else { return 0.0 }
        return loanAmount
    }
    
    func getInterestRate() -> Double {
        guard let interestRateString = interestRateTextField.text,
            !interestRateString.isEmpty else { return 0.0 }
        guard let interestRate = Double(interestRateString) else { return 0.0 }
        return interestRate
    }
    
    func getDownPayment() -> Double {
        guard let downPaymentString = downPaymentTextField.text,
            !downPaymentString.isEmpty else { return 0.0 }
        guard let downPayment = Double(downPaymentString) else { return 0.0 }
        return downPayment
    }
    
    func getMortgageLength() -> Int {
        guard let length = mortgageLength else { return 0 }
        return length
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        getInputs()
        
    }
    
    
}

extension MortgageCalculatorViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return mortgageLengthData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mortgageLengthData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mortgageLengthData[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let mortgageLengthString = mortgageLengthData[component][row]
        if  mortgageLengthString == mortgageLengthData[1][0] {
            mortgageLength = .fifteen
        } else if mortgageLengthString == mortgageLengthData[1][1] {
            mortgageLength = .twenty
        } else if mortgageLengthString == mortgageLengthData[1][2] {
            mortgageLength = .thirty
        } else {
            mortgageLength = .forty
        }
    }
    
}
/*
extension MortgageCalculatorViewController {
    func addAccessoryView() -> Void {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
        let nextButton = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(self.nextButtonTapped(button:)))
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonTapped(button:)))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [nextButton, flexSpace, doneButton]
        toolBar.tintColor = UIColor(red:0.00, green:0.51, blue:0.33, alpha:1.0)
        loanAmountTextField.inputAccessoryView = toolBar
        interestRateTextField.inputAccessoryView = toolBar
        downPaymentTextField.inputAccessoryView = toolBar
        monthlyHOATextField.inputAccessoryView = toolBar
        yearlyHomeInsuranceTextField.inputAccessoryView = toolBar
        yearlyPropertyTaxTextField.inputAccessoryView = toolBar
    }
    @objc func nextButtonTapped(button:UIBarButtonItem) -> Void {
        if loanAmountTextField.isFirstResponder {
            interestRateTextField.becomeFirstResponder()
        } else if interestRateTextField.isFirstResponder {
            downPaymentTextField.becomeFirstResponder()
        } else if downPaymentTextField.isFirstResponder {
            monthlyHOATextField.becomeFirstResponder()
        } else if monthlyHOATextField.isFirstResponder {
            yearlyHomeInsuranceTextField.becomeFirstResponder()
        } else if yearlyHomeInsuranceTextField.isFirstResponder {
            yearlyPropertyTaxTextField.becomeFirstResponder()
        } else if yearlyPropertyTaxTextField.isFirstResponder {
            yearlyPropertyTaxTextField.resignFirstResponder()
        }
    }
    
    @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
        self.view.endEditing(true)
    }
    
}
*/
