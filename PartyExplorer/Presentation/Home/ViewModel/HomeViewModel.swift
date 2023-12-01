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
    func generateRandomParty()
}

final class HomeViewModel: HomeViewModelProtocol {
    @Published var filteredParties = [PartyEntity]()
    @Published var searchText: String = "" {
        didSet {
            filterParties()
        }
    }

    private let service: PartyServiceProtocol
    private let oneDayInSecondsValue: TimeInterval = 86400

    private var allPartyNamesList = [String]()
    private var allImageNamesList = [String]()
    private var parties = [PartyEntity]()

    init(service: PartyServiceProtocol) {
        self.service = service
    }

    @MainActor
    func fetchPartyList() async {
        do {
            let dataFetched = try await service.fetchPartyData()

            allPartyNamesList = dataFetched.compactMap { $0.name }
            allImageNamesList = dataFetched.compactMap { $0.bannerName }

            parties = dataFetched.map(PartyEntity.init)
            filteredParties = parties
        } catch {
            // TODO
        }
    }

    func generateRandomParty() {
        let randomName = allPartyNamesList.randomElement() ?? ""
        let randomImage = allImageNamesList.randomElement() ?? ""
        let randomPrice = Double.random(in: 20...100)
        let randomStartDate = Date().toString()
        let randomDate = Date().addingTimeInterval(oneDayInSecondsValue).toString()
        let randomEndDate: String? = Bool.random() ? randomDate : nil
        let randomAttendees = Int.random(in: 1...30)

        let newParty = PartyEntity(
            id: UUID(),
            name: "\(randomName) - New",
            bannerName: randomImage,
            price: randomPrice.toCurrencyString(),
            startDate: randomStartDate,
            attendeesCount: String(randomAttendees),
            endDate: randomEndDate
        )
        parties.insert(newParty, at: 0)
        filteredParties = parties
    }

    private func filterParties() {
        if searchText.isEmpty {
            filteredParties = parties
        } else {
            filteredParties = parties.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}
