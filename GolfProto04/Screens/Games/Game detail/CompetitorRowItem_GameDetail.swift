//
//  CompetitorRowItem_GameDetail.swift
//  GolfProto03
//
//  Created by Philip Nye on 17/04/2023.
//

import SwiftUI

struct CompetitorRowItem_GameDetail: View {
    @EnvironmentObject var currentGF: CurrentGameFormat
    var competitor: Competitor
    var game: GameViewModel
    @Binding var needsRefresh: Bool
    var body: some View {
        VStack(spacing: 0) {
            
            HStack(spacing: 0){
                Text(needsRefresh.description)// this refreshes screen when teebox changed on pop up sheet
                    .frame(width:0, height:0)
                    .opacity(0)
                
                
                Group{
                    Text(competitor.FirstName())
                        .frame(height: 50)
                    Spacer()
                        .frame(width: 5)
                    Text(competitor.LastName())
                    Spacer()
                        .frame(width: 5)
      
                    
                    
                }
                
                
                .foregroundColor(darkTeal)
                .font(.title3)
                //Text(competitor.TeeBoxColour())
                Spacer()
                if competitor.shotsRecdMatch != 0 {
                    Text("(\(competitor.shotsRecdMatch.formatted()))")
                        .foregroundColor(burntOrange)
                        .font(.title3)
                }
                Spacer()
                    .frame(width: 1)
                
                Text(round(competitor.playingHandicap).formatted())
                    .frame(width: 30, alignment: .trailing)
                    .foregroundColor(darkTeal)
                    .font(.title3)
                //.fontWeight(.semibold)
                
                
                Spacer()
                    .frame(width: 5)
                HStack{
                    if currentGF.assignTeamGrouping == Assignment.TeamsAB {
                        ZStack{
                            Text(competitor.team_String.stringValueInitial())
                                .font(.headline)
                                .zIndex(2)
                            Circle()
                                .fill(.white)
                            
                                .frame(width: 23, height: 23)
                                .zIndex(1)
                            Circle()
                                .fill(.gray)
                            
                                .frame(width: 24, height: 24)
                                .zIndex(0)
                            
                        }
                    }
                }.frame(width:30, height:30)
                    .background(Color(competitor.teeBox?.teeBoxColor ?? UIColor(.clear)))
                    .border(.black.opacity(0.2))
            }
            HStack{
                Text("Handicap index: (\(competitor.handicapIndex.formatted()))")
                   
                Text("Course handicap: \(round(competitor.courseHandicap).formatted())")
            }
            .foregroundColor(burntOrange)
            .font(.caption2)
            HStack{
                
                if currentGF.assignShotsRecd != Assignment.TeamC {
                    Text("Playing handicap: \((competitor.handicapAllowance as NSNumber).getPercentage()) * \(String(format: "%.1f", round(competitor.courseHandicap))) = \(String(format: "%.2f", competitor.playingHandicap)) (\(String(format: "%.0f", round(competitor.playingHandicap))))")
                } else {
                    Text("Playing handicap: \((competitor.handicapAllowance as NSNumber).getPercentage()) * \(String(format: "%.1f", round(competitor.courseHandicap))) = \(String(format: "%.2f", competitor.playingHandicap))")
                }
//                Text("Handicap allowance: \(competitor.handicapAllowance.formatted())")
//                Text("Playing handicap: \(competitor.playingHandicap.formatted())")
            }
            .font(.caption2)
            .foregroundColor(darkTeal)
            
            if game.game.TeeBoxesAllSame() == false && competitor.diffTeesXShots != 0 {
                VStack{
                    Text("Extra shots: \(String(format: "%.2f", competitor.diffTeesXShots))")
                    HStack(spacing: 0){
                        Text("\(competitor.TeeBoxColour()) tees ")
                        Text(String(competitor.teeBox?.TotalDistance() ?? 0))
                        Text(game.game.defaultTeeBox?.course?.club?.dist_metric.stringValueInitial() ?? "y")
                        Spacer()
                            .frame(width: 4)
                        Text("Par: \(String(competitor.teeBox?.TotalPar() ?? 0))")
                        Spacer()
                            .frame(width: 4)
                        Text("SR \(String(competitor.SlopeRating()))")
                        Spacer()
                            .frame(width: 4)
                        Text("CR \(String(competitor.CourseRating()))")
                        
                       
                    }
                }
                    .font(.caption2)
                    .foregroundColor(darkTeal)
            }
            
            
            if competitor.shotsRecdMatch > 1 {
                Text("Shots received: \(competitor.shotsRecdMatch.formatted()) shots")
                    .font(.caption)
                    .foregroundColor(darkTeal)
            } else if competitor.shotsRecdMatch == 1 {
                Text("Shots received: \(competitor.shotsRecdMatch.formatted()) shot")
                    .font(.caption)
                    .foregroundColor(darkTeal)
            }
            
            Spacer()
        }//VStack
        
        
    }
}

struct CompetitorRowItem_GameDetail_Previews: PreviewProvider {
    static var previews: some View {
        let competitor = CompetitorViewModel(competitor: Competitor(context: CoreDataManager.shared.viewContext)).competitor
        let game = GameViewModel(game: Game(context: CoreDataManager.shared.viewContext))
//        competitor.player?.firstName = "Philip"
//        competitor.player?.lastName = "Birkenstock"
        CompetitorRowItem_GameDetail(competitor: competitor,game: game, needsRefresh: .constant(false))
            .environmentObject(CurrentGameFormat())
    }
}
