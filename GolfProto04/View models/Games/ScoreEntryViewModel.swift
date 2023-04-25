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
    
    var grossScore: Int = 0
    
    
    func saveCompetitorScore(competitor: Competitor, hole: Int) {
        let manager = CoreDataManager.shared
        // get the CompetitorScore for the current competitor and current hole and add the grossScore
        
        let currentCS = competitor.competitorScoresArray.filter({$0.hole == hole})
        
        let CS = manager.getCompetitorScoreById(id: currentCS.first!.objectID)
        CS?.grossScore = Int16(grossScore)
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
