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
    var body: some View {
        List(allPlayers, id: \.self, selection: $selection) { player in
            Text(player.name)
        }
        .navigationTitle("Select Players")
        .environment(\.editMode, .constant(.active))
        .onChange(of: selection) {
            if selection.count > 0 {
                selectedPlayers = Array(selection).sorted()
            }
        }
    }
}

#Preview {
    PlayersListView(
        allPlayers: Player.allPlayers,
        selectedPlayers: .constant([])
    )
}



struct Player: Identifiable, Hashable, Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        lhs.number < rhs.number
    }
    
    var id = UUID()
    let number: Int
    let name: String
    
    static var allPlayers: [Player] = {
        var players: [Player] = []
        for number in 1...10 {
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
