//
//  TeamsABPlayingHandicaps.swift
//  GolfProto04
//
//  Created by Philip Nye on 23/04/2023.
//

import SwiftUI

struct TeamsABPlayingHandicaps: View {
    @Binding var needsRefesh: Bool
    let game: GameViewModel
    var body: some View {
        HStack{
            Text("Team playing handicaps  A: \(game.game.teamShotsArray[0].playingHandicap.formatted())   B: \(game.game.teamShotsArray[1].playingHandicap.formatted())")
            Text(String(format: "%.2f",game.game.TotalPlayingHandicapA()))
            Text(String(format: "%.2f",game.game.TotalPlayingHandicapB()))
//            Text("Team A PH: \(game.game.teamShotsArray[0].playingHandicap.formatted())")
//            Text("Team B PH: \(game.game.teamShotsArray[1].playingHandicap.formatted())")
            Text(needsRefesh.description)
                .opacity(0)
                .frame(width:0, height: 0)
        }
        .font(.subheadline)
        .foregroundColor(darkTeal)
    }
}

struct TeamsABPlayingHandicaps_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameViewModel(game: Game(context: CoreDataManager.shared.viewContext))
        TeamsABPlayingHandicaps(needsRefesh: .constant(false),game: game)
    }
}
