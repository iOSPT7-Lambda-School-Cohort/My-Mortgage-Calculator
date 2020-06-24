//
//  MortgageLoan.swift
//  MyMortgage
//
//  Created by Gladymir Philippe on 6/18/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import Foundation

struct MortgageLoan: Codable, Equatable {
    var amount: Double?
    var mortgageType: String
    var downPayment: Double?
    var interestRate: Double?
    var mortgageLength: Int?
    var savedName: String?
    var monthlyHOA: Double?
    var homeInsurance: Double?
    var propertyTax: Double?
    
    var maxInterestRate: Double?
    var estRateChange: Double?
    var initialLength: Int?
    
    
    init(mortgageType: String) {
        self.amount = nil
        self.mortgageType = mortgageType
        self.downPayment = nil
        self.interestRate = nil
        self.mortgageLength = nil
        self.savedName = nil
        self.monthlyHOA = nil
        self.homeInsurance = nil
        self.propertyTax = nil
        
        self.maxInterestRate = nil
        self.estRateChange = nil
        self.initialLength = nil
    }
}
