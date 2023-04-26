//
//  ScoreEntryScreen.swift
//  GolfProto04
//
//  Created by Philip Nye on 25/04/2023.
//

import SwiftUI

struct ScoreEntryScreen: View {
    @StateObject var scoreEntryVM: ScoreEntryViewModel = ScoreEntryViewModel()
    @State private var showHoleNavigator: Bool = false
    var game: GameViewModel
    var body: some View {
        ZStack{
            GeometryReader { geo in
                HoleNavigatorPopUp(showHoleNavigator: $showHoleNavigator)
                             .zIndex(1)
                             .offset(x:geo.size.width * 0.1, y: geo.size.height * 0.195)
                
                
                HStack(spacing: 0){

                    Text(game.name)
                            .frame(width: geo.size.width * 0.48, alignment: .leading)
                            .offset(x:geo.size.width * 0.02, y: geo.size.height * 0.02)
                    Text(game.game.scoreEntryTeeBox?.course?.club?.wrappedName ?? "")
                            .frame(width: geo.size.width * 0.48, alignment: .trailing)
                            .offset(x:geo.size.width * 0.02, y: geo.size.height * 0.02)
                    }
                    .font(.title2)
                    .foregroundColor(darkTeal)
                    .zIndex(0)
                
                HStack(spacing: 0){
                    Text("\(game.game.scoreEntryTeeBox?.wrappedColour.capitalizingFirstLetter() ?? "no teebox found") tees") //teeBox for game
                        .frame(width:geo.size.width * 0.26, alignment: .leading)
                    
                        Text(String(game.game.scoreEntryTeeBox?.TotalDistance() ?? 0) + (game.game.scoreEntryTeeBox?.course?.club?.dist_metric.stringValueInitial() ?? ""))
                            .frame(width:geo.size.width * 0.18, alignment: .leading)
                    
                    Text("Par: \(game.game.scoreEntryTeeBox?.TotalPar() ?? 0)")
                        .frame(width:geo.size.width * 0.2, alignment: .leading)
                    
                    
                    
                    Text(game.game.scoreEntryTeeBox?.course?.name ?? "")
                        .frame(width:geo.size.width * 0.32, alignment: .trailing)
                    
                }
                .zIndex(0)
                        .offset(x:geo.size.width * 0.02, y: geo.size.height * 0.058)
                        .foregroundColor(darkTeal)
                    HStack(spacing:0){
                        Text(game.game.game_format.stringValue())
                            .frame(width: geo.size.width * 0.37, alignment: .leading)
                            .offset(x:geo.size.width * 0.02, y: geo.size.height * 0.088)
                        Text(game.game.play_format.stringValue())
                            .frame(width: geo.size.width * 0.21, alignment: .center)
                            .offset(x:geo.size.width * 0.00, y: geo.size.height * 0.088)
                        Text(game.game.sc_format.stringValue())
                            .frame(width: geo.size.width * 0.21, alignment: .center)
                            .offset(x:geo.size.width * 0.00, y: geo.size.height * 0.088)
                        Text(game.game.hcap_format.stringValue())
                            .frame(width: geo.size.width * 0.21, alignment: .center)
                        
                        
                            .offset(x:geo.size.width * 0.00, y: geo.size.height * 0.088)
                    }
                    .font(.subheadline)
                    .foregroundColor(darkTeal)
                    .zIndex(0)
                    HStack(spacing: 0){
                        Text("Hole ")
                        Text(String(scoreEntryVM.holeIndex + 1))
                        Spacer()
                            .frame(width:3)
                        Button {
                            showHoleNavigator.toggle()
                        } label: {
                            
                            
                            
                            Label("", systemImage: "arrowtriangle.down.fill")
                                .font(.system(size: 20))
                            
                        }
                        
                        
                        
                        .background(burntOrange)
                        
                        
                        .foregroundColor(.white)
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    }
                    .frame(width: geo.size.width * 1, height: 50)
                    .font(.title)
                    .background(burntOrange)
                    .foregroundColor(.white)
                    .offset(x:0, y: geo.size.height * 0.13)
                    .zIndex(0)
                    
                    
                    
                    
                    
                    HStack{
                        Text(String(game.game.scoreEntryTeeBox?.holesArray[scoreEntryVM.holeIndex].distance ?? 0))
                        Text("Par \(game.game.scoreEntryTeeBox?.holesArray[scoreEntryVM.holeIndex].par ?? 0)")
                        Text("S.I. \(game.game.scoreEntryTeeBox?.holesArray[scoreEntryVM.holeIndex].strokeIndex ?? 0)")
                    }
                    .frame(width: geo.size.width * 1, height: 50)
                    .font(.title2)
                    .background(gold)
                    .foregroundColor(darkTeal)
                    .offset(x:0, y: geo.size.height * 0.21)
                    .zIndex(0)
                    
                    
                    
                    if scoreEntryVM.holeIndex != 0 {
                        
                        Button("< Hole \(scoreEntryVM.holeIndex)"){
                            
                            scoreEntryVM.holeIndex -= 1
                            //games.allGames[scoreEntryVar.CGI].lastHoleIndex = scoreEntryVar.holeIndex
                            
                        }
                        .buttonStyle(HoleButton())
                        
                        .frame(width: geo.size.width * 0.27, height: 50)
                        .offset(x:geo.size.width * 0.05, y: geo.size.height * 0.13)
                        //.padding([.leading], 25)
                        .disabled(scoreEntryVM.holeIndex == 0)
                        .zIndex(0)
                    }
                    
                    if scoreEntryVM.holeIndex != 17 {
                        
                        Button("Hole \(scoreEntryVM.holeIndex + 2) >"){
                            
                            scoreEntryVM.holeIndex += 1
                            print("forward")
                            //games.allGames[scoreEntryVar.CGI].lastHoleIndex = scoreEntryVar.holeIndex
                            
                        }
                        .buttonStyle(HoleButton())
                        
                        .frame(width: geo.size.width * 0.27, height: 50)
                        .offset(x:geo.size.width * 0.68, y: geo.size.height * 0.13)
                        //.padding([.leading], 25)
                        .disabled(scoreEntryVM.holeIndex == 17)
                        .zIndex(0)
                        
                    }
                    HStack(spacing:0){
                        
                        HStack(spacing: 5){
                            Text("Geoffrey")
                            Text("L")
                        }
                        .font(.title)
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(darkTeal)
                        .frame(width: geo.size.width * 0.4, height: 75,alignment: .leading)
                        .padding([.leading],10)
                        Spacer()
                        
                        HStack(spacing:25){
                            Button(action: {
                                //          code here
                                
                                scoreEntryVM.grossScore -= 1
                                
                                //                    score -= 1
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
                            
                            Text(scoreEntryVM.grossScore.formatted())
                            
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
                                //code here
                                scoreEntryVM.grossScore += 1
                                
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(gold)
                            }
                        }
                        .frame(width: geo.size.width * 0.5)
                    }
                        
                    .frame(width: geo.size.width * 0.95, height:70, alignment: .trailing)
                    //.background(.blue)
                    .offset(x:geo.size.width * 0, y: geo.size.height * 0.33)
                    .zIndex(0)
                
                
                
                }//geo
            
        }
            
            
        
    }
}

struct ScoreEntryScreen_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameViewModel(game: Game(context: CoreDataManager.shared.viewContext))
        ScoreEntryScreen(game: game)
            
    }
}
