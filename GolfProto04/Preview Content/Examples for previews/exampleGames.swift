//
//  exampleGames.swift
//  GolfProto04
//
//  Created by Philip Nye on 08/05/2023.
//

import Foundation

extension Game {
    static var exampleGame: Game = Game(context: CoreDataManager.shared.viewContext)
  //  self.exampleGame.clubName = "North"
    
}
