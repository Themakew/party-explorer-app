//
//  Date+Extension.swift
//  PartyExplorer
//
//  Created by Ruyther Costa on 2023-12-01.
//

import Foundation

extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
}
