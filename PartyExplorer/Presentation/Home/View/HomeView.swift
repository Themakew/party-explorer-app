//
//  HomeView.swift
//  PartyExplorer
//
//  Created by Ruyther Costa on 2023-12-01.
//

import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search Parties", text: $viewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                List(viewModel.filteredParties) { partyObject in
                    PartyRowView(partyObject: partyObject)
                }
            }
            .navigationTitle("Parties")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.fetchPartyList()
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(service: PartyService(apiRequest: APIRequest())))
}
