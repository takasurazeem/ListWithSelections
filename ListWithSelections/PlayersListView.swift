//
//  PlayersListView.swift
//  ListWithSelections
//
//  Created by Takasur Azeem on 24/09/2023.
//

import SwiftUI

struct PlayersListView: View {
    let allPlayers: [Player]
    @State private var selection = Set<Player>()
    @Binding var selectedPlayers: [Player]
    @State private var searchText = ""
    var searchResults: [Player] {
        if searchText.isEmpty {
            return allPlayers
        }
        return allPlayers
            .filter { $0.name.contains(searchText) }
    }
    var body: some View {
        List(
            searchResults,
            id: \.self,
            selection: $selection
        ) { player in
            Text(player.name)
        }
        .onAppear {
            selection = Set(selectedPlayers)
        }
        .navigationTitle("Select Players")
        .environment(\.editMode, .constant(.active))
        .onChange(of: selection) {
            if !selection.isEmpty {
                selectedPlayers = Array(selection).sorted()
            }
        }
        .searchable(text: $searchText, prompt: Text("Player name or number"))
    }
}

#Preview {
    PlayersListView(
        allPlayers: Player.allPlayers,
        selectedPlayers: .constant([])
    )
}



struct Player: Codable, Identifiable, Hashable, Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        lhs.number < rhs.number
    }
    
    var id = UUID()
    let number: Int
    let name: String
    
    static var allPlayers: [Player] = {
        var players: [Player] = []
        for number in 1...100 {
            players.append(
                Player(
                    number: number,
                    name: "Player \(number)"
                )
            )
        }
        return players
    }()
}
