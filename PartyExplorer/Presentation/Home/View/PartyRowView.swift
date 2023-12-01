//
//  PartyRowView.swift
//  PartyExplorer
//
//  Created by Ruyther Costa on 2023-12-01.
//

import SwiftUI

struct PartyRowView: View {
    let partyObject: PartyEntity

    private let widthViewValue: CGFloat = UIScreen.main.bounds.width - 50

    var body: some View {
        VStack {
            Image(partyObject.bannerName)
                .resizable()
                .scaledToFill()
                .frame(width: widthViewValue, height: 200)
                .clipped()

            VStack {
                partyDetails
            }
        }
    }

    var partyDetails: some View {
        VStack {
            HStack {
                Text(partyObject.name)
                    .font(.title)
                    .bold()
                Spacer()
                Text(partyObject.price)
                    .font(.subheadline)
            }
            .padding(.bottom, 1)

            HStack(spacing: 0) {
                Text("Start: \(partyObject.startDate)")
                    .padding(.trailing)

                if let endDate = partyObject.endDate {
                    Text("End: \(endDate)")
                        .padding(.trailing)
                }

                Spacer()
            }
            .padding(.bottom, 1)

            HStack {
                Text("Attendeed: \(partyObject.attendeesCount)")
                    .padding(.trailing)
                Spacer()
            }
            .padding(.bottom)
        }
        .frame(width: widthViewValue)
    }
}
