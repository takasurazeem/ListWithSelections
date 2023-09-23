//
//  ContentView.swift
//  ListWithSelections
//
//  Created by Takasur Azeem on 24/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedPlayers: [Player] = []
    var body: some View {
        NavigationStack {
            List {
                Section("") {
                    NavigationLink {
                        PlayersListView(
                            allPlayers: Player.allPlayers,
                            selectedPlayers: $selectedPlayers
                        )
                    } label: {
                        Text("Select Players")
                    }
                }
                if !selectedPlayers.isEmpty {
                    Section("Selected Players") {
                        ForEach(selectedPlayers) {
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
