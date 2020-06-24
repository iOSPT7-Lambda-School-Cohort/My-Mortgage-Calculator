//
//  State.swift
//  MyMortgage
//
//  Created by Gladymir Philippe on 6/18/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import Foundation

struct State: Codable {
    var State: String
    var costIndex: String
    var costRank: Int
    var groceryCost: String
    var housingCost: String
    var utilitiesCost: String
    var transportationCost: String
    var miscCost: String
}
