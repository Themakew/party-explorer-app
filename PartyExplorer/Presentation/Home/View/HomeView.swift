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

                Button("Add Random Party") {
                    viewModel.generateRandomParty()
                }
                .padding()

                List(viewModel.filteredParties) { partyObject in
                    PartyRowView(partyObject: partyObject)
                }
            }
            .navigationTitle("Parties")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.fetchPartyList()
            }
            .alert("Error", isPresented: $viewModel.showErrorAlert) {
                Button("Try Again") {
                    Task {
                        await viewModel.fetchPartyList()
                    }
                }
                Button("OK", role: .cancel) {}
            } message: {
                Text(viewModel.errorMessage)
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(service: PartyService(apiRequest: APIRequest())))
}
