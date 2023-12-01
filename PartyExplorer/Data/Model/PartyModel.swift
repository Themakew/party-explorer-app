//
//  PartyModel.swift
//  PartyExplorer
//
//  Created by Ruyther Costa on 2023-12-01.
//

struct PartyModel: Decodable {
    let name: String
    let bannerName: String
    let price: Double
    let startDate: String
    let attendeesCount: Int
    let endDate: String?
}
