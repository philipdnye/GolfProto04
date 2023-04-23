//
//  TeamsABShotsReceived.swift
//  GolfProto04
//
//  Created by Philip Nye on 23/04/2023.
//

import SwiftUI

struct TeamsABShotsReceived: View {
    @Binding var needsRefresh: Bool
    let game: GameViewModel
    var body: some View {
        HStack{
            Text(needsRefresh.description)
                .opacity(0)
                .frame(width:0, height: 0)
            if game.game.teamShotsArray[0].shotsRecd != 0 {
                Text("Team A receive \(game.game.teamShotsArray[0].shotsRecd.formatted()) shots.")
            } else {
                Text("Team B receive \(game.game.teamShotsArray[1].shotsRecd.formatted()) shots.")
            }
        }
        .font(.subheadline)
        .foregroundColor(darkTeal)
    }
}

struct TeamsABShotsReceived_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameViewModel(game: Game(context: CoreDataManager.shared.viewContext))
        TeamsABShotsReceived(needsRefresh: .constant(false),game: game)
    }
}
