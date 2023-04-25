//
//  ScoreEntryScreen.swift
//  GolfProto04
//
//  Created by Philip Nye on 25/04/2023.
//

import SwiftUI

struct ScoreEntryScreen: View {
    @StateObject var scoreEntryVM: ScoreEntryViewModel
    
    var body: some View {
        VStack{
            GeometryReader { geo in
                HStack(spacing: 0){
                    Text("Sunday roll up")
                        .frame(width: geo.size.width * 0.48, alignment: .leading)
                        .offset(x:geo.size.width * 0.02, y: geo.size.height * 0.00)
                    Text("North Hants")
                        .frame(width: geo.size.width * 0.48, alignment: .trailing)
                        .offset(x:geo.size.width * 0.02, y: geo.size.height * 0.00)
                }
                .font(.title2)
                .foregroundColor(darkTeal)
                Text("White tees  6043y Par 71 C.R. 69.5 ")
                    .offset(x:geo.size.width * 0.03, y: geo.size.height * 0.04)
                    .foregroundColor(darkTeal)
                Text("Fourball better ball  MatchPlay  Medal")
                    .offset(x:geo.size.width * 0.03, y: geo.size.height * 0.08)
                    .foregroundColor(darkTeal)
                
                Text("Hole  \(scoreEntryVM.holeIndex + 1)")
                    .frame(width: geo.size.width * 1, height: 50)
                    .font(.title)
                    .background(burntOrange)
                    .foregroundColor(.white)
                    .offset(x:0, y: geo.size.height * 0.15)
                
                
                Text("Par")
                    .frame(width: geo.size.width * 1, height: 50)
                    .font(.title)
                    .background(gold)
                    .foregroundColor(darkTeal)
                    .offset(x:0, y: geo.size.height * 0.23)
                
                
                
                if scoreEntryVM.holeIndex != 0 {
                    
                    Button("< Hole \(scoreEntryVM.holeIndex)"){
                        
                        scoreEntryVM.holeIndex -= 1
                        //games.allGames[scoreEntryVar.CGI].lastHoleIndex = scoreEntryVar.holeIndex
                        
                    }
                    .buttonStyle(HoleButton())
                    
                    .frame(width: geo.size.width * 0.27, height: 50)
                    .offset(x:geo.size.width * 0.05, y: geo.size.height * 0.15)
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
                    .offset(x:geo.size.width * 0.68, y: geo.size.height * 0.15)
                    //.padding([.leading], 25)
                    .disabled(scoreEntryVM.holeIndex == 17)
                    
                }
                
                
                
                
            }
            
        }
            
            
        
    }
}

struct ScoreEntryScreen_Previews: PreviewProvider {
    static var previews: some View {
       
        ScoreEntryScreen(scoreEntryVM: ScoreEntryViewModel())
            
    }
}
