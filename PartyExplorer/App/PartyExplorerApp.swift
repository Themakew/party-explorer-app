//
//  PartyExplorerApp.swift
//  PartyExplorer
//
//  Created by Ruyther Costa on 2023-12-01.
//

import SwiftUI

@main
struct PartyExplorerApp: App {
    var body: some Scene {
        WindowGroup {
            let apiRequest = APIRequest()
            let service = PartyService(apiRequest: apiRequest)
            let viewModel = HomeViewModel(service: service)
            HomeView(viewModel: viewModel)
        }
    }
}
