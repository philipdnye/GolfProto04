//
//  ScoreEntryCompetitorRow.swift
//  GolfProto04
//
//  Created by Philip Nye on 26/04/2023.
//

import SwiftUI

struct ScoreEntryCompetitorRow: View {
    var competitorIndex: Int
    
    //@StateObject var scoreEntryVM: ScoreEntryViewModel
//    @Binding var competitorScore: Int
    @EnvironmentObject var scoreEntryVM: ScoreEntryViewModel
    var body: some View {
        
        HStack(spacing:0){
            HStack(spacing: 5){
                Text(scoreEntryVM.currentGame.game.competitorArray[competitorIndex].FirstName())
                Text(scoreEntryVM.currentGame.game.competitorArray[competitorIndex].LastName().prefix(1).capitalized)
            }
            .font(.title)
            .font(.footnote.weight(.semibold))
            .foregroundColor(darkTeal)
            //                .frame(width: geo.size.width * 0.4, height: 75,alignment: .leading)
            .padding([.leading],10)
            
            Spacer()
            
            
            
            //            .frame(width: geo.size.width * 0.95, height:70, alignment: .trailing)
            //.background(.blue)
            //            .offset(x:geo.size.width * 0, y: geo.size.height * 0.33)
            //            .zIndex(0)
            
            
            HStack(spacing:25){
                Button(action: {
                    scoreEntryVM.competitorsScores[scoreEntryVM.holeIndex][competitorIndex] -= 1
//                    competitorScore -= 1
//                    let manager = CoreDataManager.shared
//                    let CC = manager.getCompetitorById(id: competitor.objectID)
//                    CC?.competitorScoresArray[scoreEntryVM.holeIndex].grossScore = Int16(competitorScore)
//                    manager.save()
                    
                    //                    scoreCommitted = true
                    //                    games.allGames[scoreEntryVar.CGI].CompetitorsCurrentResult(competitorsNetScoresToPar: &scoreEntryVar.competitorsNetScoreToPar)
                    //                    games.saveGamesFM()
                    
                    //            scoreEntryVar.minusTapCount -= 1
                }) {
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(gold)
                }
                //.disabled(score < 1)
                
                Text(scoreEntryVM.competitorsScores[scoreEntryVM.holeIndex][competitorIndex].formatted())
                
                    .frame(width: 32, height: 32)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(darkTeal, lineWidth: 2)
                    )
                
                    .font(.title)
                    .font(.footnote.weight(.bold))
                    .foregroundColor(.brown)
                    .opacity(0.6)
                
                
                
                Button(action: {
                    scoreEntryVM.competitorsScores[scoreEntryVM.holeIndex][competitorIndex] += 1
//                    competitorScore += 1
//                    let manager = CoreDataManager.shared
//                    let CC = manager.getCompetitorById(id: competitor.objectID)
//                    CC?.competitorScoresArray[scoreEntryVM.holeIndex].grossScore = Int16(competitorScore)
//                    manager.save()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(gold)
                }
            }
            //Text(scoreEntryVM.holeIndex.formatted())
            //            .frame(width: geo.size.width * 0.5)
            //            .offset(x:geo.size.width * 0.5, y: geo.size.height * 0.33)
            //            .zIndex(0)
        }
        .onAppear(perform: {
           // competitorScore = Int(competitor.competitorScoresArray[scoreEntryVM.holeIndex].grossScore)
        })
        
    }
}
struct ScoreEntryCompetitorRow_Previews: PreviewProvider {
    static var previews: some View {
        ScoreEntryCompetitorRow(competitorIndex: 0)
            .environmentObject(ScoreEntryViewModel())
    }
}
