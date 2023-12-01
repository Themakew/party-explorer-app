//
//  Double+Extension.swift
//  PartyExplorer
//
//  Created by Ruyther Costa on 2023-12-01.
//

import Foundation

extension Double {
    func toCurrencyString() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.currencySymbol = "$"
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
