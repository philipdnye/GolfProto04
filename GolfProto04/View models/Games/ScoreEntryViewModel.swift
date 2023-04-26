//
//  ScoreEntryViewModel.swift
//  GolfProto04
//
//  Created by Philip Nye on 25/04/2023.
//

import Foundation
import SwiftUI


class ScoreEntryViewModel: ObservableObject {
    @StateObject private var gameListVM = GameListViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    @Published var holeIndex: Int = 0
    
    @Published var grossScore: Int = 0
    @Published var competitorsScores: [[Int]] = Array(repeating: [0,0,0,0], count: 18)
    @Published var currentGame: GameViewModel = GameViewModel(game: Game())
    
    func loadCompetitorsScore() {
        let manager = CoreDataManager.shared
        let game = manager.getGameById(id: self.currentGame.id)
        for i in 0..<(game?.competitorArray.count ?? 0) {
            for j in 0..<18 {
                self.competitorsScores[j][i] = Int(game?.competitorArray[i].competitorScoresArray[j].grossScore ?? 0)
            }
        }
        
        
    }
    
    
    
    func saveCompetitorsScore() {
        let manager = CoreDataManager.shared
        let game = manager.getGameById(id: self.currentGame.id)
        
        for i in 0..<(game?.competitorArray.count ?? 0) {
            for j in 0..<18 {
                game?.competitorArray[i].competitorScoresArray[j].grossScore = Int16(self.competitorsScores[j][i])
            }
        }
        
        
        
        manager.save()
    }
    
    // similar func for TEAM
    
}


struct HoleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3)
            .padding(6)
            .background(burntOrange)
            .foregroundColor(.white)
          
            
    }
}
