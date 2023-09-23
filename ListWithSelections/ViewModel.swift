//
//  ViewModel.swift
//  ListWithSelections
//
//  Created by Takasur Azeem on 24/09/2023.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var selectedPlayers: [Player] = []
}
