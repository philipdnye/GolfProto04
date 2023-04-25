//
//  ScoreEntryScreen.swift
//  GolfProto04
//
//  Created by Philip Nye on 25/04/2023.
//

import SwiftUI

struct ScoreEntryScreen: View {
    @StateObject var scoreEntryVM: ScoreEntryViewModel
    @State private var showHoleNavigator: Bool = false
    var body: some View {
        VStack{
            GeometryReader { geo in
               
                    HStack(spacing: 0){
//                        HoleNavigatorPopUp(showHoleNavigator: $showHoleNavigator)
//                            .zIndex(1)
                        Text("Sunday roll up")
                            .frame(width: geo.size.width * 0.48, alignment: .leading)
                            .offset(x:geo.size.width * 0.02, y: geo.size.height * 0.02)
                        Text("North Hants")
                            .frame(width: geo.size.width * 0.48, alignment: .trailing)
                            .offset(x:geo.size.width * 0.02, y: geo.size.height * 0.02)
                    }
                    .font(.title2)
                    .foregroundColor(darkTeal)
                
                HStack(spacing: 0){
                    Text("White tees 6043y Par 71")
                        .frame(width:geo.size.width * 0.64, alignment: .leading)
                    Text("Old course")
                        .frame(width:geo.size.width * 0.32, alignment: .trailing)
                    
                }
                        .offset(x:geo.size.width * 0.02, y: geo.size.height * 0.058)
                        .foregroundColor(darkTeal)
                    HStack(spacing:0){
                        Text("4ball better ball")
                            .frame(width: geo.size.width * 0.4, alignment: .leading)
                            .offset(x:geo.size.width * 0.02, y: geo.size.height * 0.088)
                        Text("MatchPlay")
                            .frame(width: geo.size.width * 0.2, alignment: .center)
                            .offset(x:geo.size.width * 0.00, y: geo.size.height * 0.088)
                        Text("Stableford")
                            .frame(width: geo.size.width * 0.2, alignment: .center)
                            .offset(x:geo.size.width * 0.00, y: geo.size.height * 0.088)
                        Text("Handicap")
                            .frame(width: geo.size.width * 0.2, alignment: .center)
                        
                        
                            .offset(x:geo.size.width * 0.00, y: geo.size.height * 0.088)
                    }
                    .foregroundColor(darkTeal)
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
                    
                    
                    
                    
                    
                    HStack{
                        Text("436 yards")
                        Text("Par 4")
                        Text("S.I. 15")
                    }
                    .frame(width: geo.size.width * 1, height: 50)
                    .font(.title2)
                    .background(gold)
                    .foregroundColor(darkTeal)
                    .offset(x:0, y: geo.size.height * 0.2)
                    
                    
                    
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
                        
                    }
                    HStack(spacing:25){
                        
                        HStack(spacing: 5){
                            Text("Geoffrey")
                            Text("L")
                        }
                        .font(.title)
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(darkTeal)
                        .frame(height: 75,alignment: .leading)
                        .padding([.leading],10)
                        Spacer()
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
                    .frame(width: geo.size.width * 0.95, height:70, alignment: .trailing)
                    //.background(.blue)
                    .offset(x:geo.size.width * 0, y: geo.size.height * 0.33)
                
                }//geo
            
        }
            
            
        
    }
}

struct ScoreEntryScreen_Previews: PreviewProvider {
    static var previews: some View {
       
        ScoreEntryScreen(scoreEntryVM: ScoreEntryViewModel())
            
    }
}
