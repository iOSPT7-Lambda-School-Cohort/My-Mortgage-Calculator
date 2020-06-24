//
//  PotentialHomePurchase.swift
//  MyMortgage
//
//  Created by Gladymir Philippe on 6/18/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import Foundation

struct PotentialHomePurchase: Codable {
    let estimatedHomePrice: Int
    let piPayment: Int
    let propertyTax: Int?
    let insurance: Int?
    let pmi: Int?
    let hoa: Int?
    let otherExpenses: Int?
    let loanAmount: Int
    let downPayment: Int
    let estClosingCosts: Int
    let date: Date
}
