//
//  PartyService.swift
//  PartyExplorer
//
//  Created by Ruyther Costa on 2023-12-01.
//

import Foundation

protocol PartyServiceProtocol {
    func fetchPartyData() async throws -> [PartyModel]
}

final class PartyService: PartyServiceProtocol {
    private let apiRequest: APIResquestProtocol

    init(apiRequest: APIResquestProtocol) {
        self.apiRequest = apiRequest
    }

    func fetchPartyData() async throws -> [PartyModel] {
        return try await apiRequest.request(fileName: "PartyData", type: PartyModel.self)
    }
}
