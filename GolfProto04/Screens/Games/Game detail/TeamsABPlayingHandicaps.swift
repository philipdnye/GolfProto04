//
//  TeamsABPlayingHandicaps.swift
//  GolfProto04
//
//  Created by Philip Nye on 23/04/2023.
//

import SwiftUI

struct TeamsABPlayingHandicaps: View {
    @EnvironmentObject var currentGF: CurrentGameFormat
    @Binding var needsRefesh: Bool
    let game: GameViewModel
    var body: some View {
        
        
        switch currentGF.noOfPlayersNeeded{
            
        case 2:
            
            HStack{
                Text("Team playing handicap  \(String(format: "%.2f",game.game.TotalPlayingHandicapA()))")
                Text(needsRefesh.description)
                    .opacity(0)
                    .frame(width:0, height: 0)
            }
            .font(.subheadline)
            .foregroundColor(darkTeal)
            
            
        default:
            HStack{
                Text("Team playing handicaps  A: \(String(format: "%.2f",game.game.TotalPlayingHandicapA()))  B: \(String(format: "%.2f",game.game.TotalPlayingHandicapB()))")
                Text(needsRefesh.description)
                    .opacity(0)
                    .frame(width:0, height: 0)
            }
            .font(.subheadline)
            .foregroundColor(darkTeal)
            
            
            
        }
        
    }
}

struct TeamsABPlayingHandicaps_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameViewModel(game: Game(context: CoreDataManager.shared.viewContext))
        TeamsABPlayingHandicaps(needsRefesh: .constant(false),game: game)
            .environmentObject(CurrentGameFormat())
    }
}
