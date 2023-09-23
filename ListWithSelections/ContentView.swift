//
//  ContentView.swift
//  ListWithSelections
//
//  Created by Takasur Azeem on 24/09/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        PlayersListView(
                            allPlayers: Player.allPlayers,
                            selectedPlayers: $viewModel.selectedPlayers
                        )
                    } label: {
                        Text("Select Players")
                    }
                }
                if !viewModel.selectedPlayers.isEmpty {
                    Section("Selected Players") {
                        ForEach(viewModel.selectedPlayers) {
                            Text($0.name)
                        }
                    }
                }
            }
            .navigationTitle("Players")
        }
    }
}

#Preview {
    ContentView()
}
