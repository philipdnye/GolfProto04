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
    
    
    func StartGame(game: Game, currentGF: CurrentGameFormat) {
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
            game.competitorArray[i].gender = Int16(game.competitorArray[i].player?.pl_gender.rawValue ?? 0)
         
            // player photo ??
        }
        
        // if handicap allocated by indiv then COmpetitor Scorecard gets created else team scorecard and team teeBox
        
        
        switch currentGF.assignShotsRecd {
        case .Indiv:
            //create a scorecard for each competitor
            
            for i in 0..<game.competitorArray.count {
               // let cs = CompetitorScore(context: manager.persistentContainer.viewContext)
                
                var holes = game.competitorArray[i].teeBox?.holesArray.sorted(by: {$0.number < $1.number})
                
                for j in 0..<(holes?.count ?? 0) {
                    let cs = CompetitorScore(context: manager.persistentContainer.viewContext)
                    cs.competitor = game.competitorArray[i]
                    cs.hole = Int16(j + 1)
                    cs.distance = Int16(holes?[j].distance ?? 0)
                    cs.par = Int16(holes?[j].par ?? 0)
                    cs.strokeIndex = Int16(holes?[j].strokeIndex ?? 0)
                    manager.save()
                }
                holes = []
                
               // game.competitorArray[i]
                manager.save()
            }
        default:
            // code for added cards and teebox for teams
            break
        }
        
        
        
        
        // competitor Score
        
        
        // team score
        
        
        //team teebox
       
        
        
        
        manager.save()
    }
    
   
    
}
