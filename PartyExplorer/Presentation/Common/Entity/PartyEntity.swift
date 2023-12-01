//
//  PartyEntity.swift
//  PartyExplorer
//
//  Created by Ruyther Costa on 2023-12-01.
//

import Foundation

struct PartyEntity: Identifiable {
    let id: UUID
    let name: String
    let bannerName: String
    let price: String
    let startDate: String
    let attendeesCount: String
    let endDate: String?

    init(id: UUID, name: String, bannerName: String, price: String, startDate: String, attendeesCount: String, endDate: String?) {
        self.id = id
        self.name = name
        self.bannerName = bannerName
        self.price = price
        self.startDate = startDate
        self.attendeesCount = attendeesCount
        self.endDate = endDate
    }

    init(from model: PartyModel) {
        self.id = UUID()
        self.name = model.name
        self.bannerName = model.bannerName
        self.price = model.price.toCurrencyString()
        self.startDate = model.startDate
        self.attendeesCount = "\(model.attendeesCount)"
        self.endDate = model.endDate
    }
}
