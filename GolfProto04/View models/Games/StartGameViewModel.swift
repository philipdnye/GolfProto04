//
//  StartGameViewModel.swift
//  GolfProto04
//
//  Created by Philip Nye on 24/04/2023.
//

import Foundation
import SwiftUI


class StartGameViewModel: ObservableObject {
    @StateObject private var playerListVM = PlayerListViewModel()
    @StateObject private var clubListVM = ClubListViewModel()
    @EnvironmentObject var currentGF: CurrentGameFormat
    @StateObject private var gameListVM = GameListViewModel()
    //game
    var clubName: String = ""
    var courseName: String = ""
    var distMetric: Int = 0
    //competitor
    var color: UIColor = UIColor(.clear)
    var teeBoxColour: String = ""
    var courseRating: Double = 0.0
    var slopeRating: Int = 0
    var firstName: String = ""
    var lastName: String = ""
    var gender: Int = 0
    
    
    func StartGame(game: Game) {
        let manager = CoreDataManager.shared
        
//        func SaveInfoToCompetitors(competitors: [Competitor]) {
//
//            ForEach(competitors, id: \.self){cc in
//
//                //cc.color = cc.teeBox?.teeBoxColor ?? UIColor(.clear)
//                cc.courseRating = cc.teeBox?.courseRating ?? 0.0
//                cc.slopeRating = Int16(cc.SlopeRating())
//                cc.teeBoxColour = cc.TeeBoxColour()
//                cc.firstName = cc.FirstName()
//                cc.lastName = cc.LastName()
//                cc.gender = cc.gender
//            }
//        }
        
        
        game.clubName = game.defaultTeeBox?.course?.club?.name
        game.courseName = game.defaultTeeBox?.course?.name
        game.distMetric = game.defaultTeeBox?.course?.club?.distMetric ?? 0
        game.dTB_slopeRating = Int16(game.defaultTeeBox?.slopeRating ?? 0)
        game.dTB_courseRating = game.defaultTeeBox?.courseRating ?? 0.0
        game.dTB_Color = game.defaultTeeBox?.wrappedColour
        game.dTB_teeBoxColour = game.defaultTeeBox?.teeBoxColor
        
        
        for i in 0..<game.competitorArray.count {
            game.competitorArray[i].courseRating = game.competitorArray[i].CourseRating()
            game.competitorArray[i].color = game.competitorArray[i].color ?? UIColor(.clear)
            game.competitorArray[i].slopeRating = Int16(game.competitorArray[i].SlopeRating())
            game.competitorArray[i].teeBoxColour = game.competitorArray[i].TeeBoxColour()
            game.competitorArray[i].firstName = game.competitorArray[i].FirstName()
            game.competitorArray[i].lastName = game.competitorArray[i].LastName()
           // game.competitorArray[i].gender = game.competitorArray[i].player?.gender    need to fix gender assignment when creating player
            // player photo ??
        }
        
        // competitor shots
        
        // add in team teeboxes
        
        // team shots
        
// create scorecard for each competitor OR team
        
        
        
        manager.save()
    }
    
   
    
}
