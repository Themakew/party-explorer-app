//
//  HomeViewModel.swift
//  PartyExplorer
//
//  Created by Ruyther Costa on 2023-12-01.
//

import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    var searchText: String { get set }
    var filteredParties: [PartyEntity] { get }

    func fetchPartyList() async
}

final class HomeViewModel: HomeViewModelProtocol {
    @Published var filteredParties = [PartyEntity]()
    @Published var searchText: String = "" {
        didSet {
            filterParties()
        }
    }

    private let service: PartyServiceProtocol
    private var parties = [PartyEntity]()

    init(service: PartyServiceProtocol) {
        self.service = service
    }

    @MainActor
    func fetchPartyList() async {
        do {
            let dataFetched = try await service.fetchPartyData()

            parties = dataFetched.map(PartyEntity.init)
            filteredParties = parties
        } catch {
            // TODO
        }
    }

    private func filterParties() {
        if searchText.isEmpty {
            filteredParties = parties
        } else {
            filteredParties = parties.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}
