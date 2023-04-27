//
//  ScorecardScreen.swift
//  GolfProto04
//
//  Created by Philip Nye on 27/04/2023.
//

import SwiftUI

struct ScorecardScreen: View {
    @EnvironmentObject var scoreEntryVM: ScoreEntryViewModel
    var body: some View {
       
        GeometryReader{geo in
            
            
            List{
                HStack(spacing: 0){
                    Text("PN")
                        .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                    Text("JD")
                        .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                    Text("PN")
                        .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                    Text("JD")
                        .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                }
                .offset(x: geo.size.width * 0.28)
                .foregroundColor(darkTeal)
                ForEach(0..<9){i in
                    HStack(spacing:0){
                        //Text(scoreEntryVM.currentGame.game.scoreEntryTeeBox?.holesArray[i].number.formatted() ?? "")
                        Text((i+1).formatted())
                            .frame(width: geo.size.width * 0.05, height: geo.size.height * 0.03)
                            .foregroundColor(darkTeal)
                        //Text(scoreEntryVM.currentGame.game.scoreEntryTeeBox?.holesArray[i].distance.formatted() ?? "")
                        Text("377")
                            .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.03)
                            .foregroundColor(darkTeal)
                        //Text(scoreEntryVM.currentGame.game.scoreEntryTeeBox?.holesArray[i].par.formatted() ?? "")
                        Text("5")
                            .frame(width: geo.size.width * 0.05, height: geo.size.height * 0.03)
                            .foregroundColor(darkTeal)
                        //Text(scoreEntryVM.currentGame.game.scoreEntryTeeBox?.holesArray[i].strokeIndex.formatted() ?? "")
                        Text("15")
                            .frame(width: geo.size.width * 0.075, height: geo.size.height * 0.03)
                            .foregroundColor(burntOrange)
                    }
                }
               
                
                
                HStack(spacing:0){
                    //hole summary front 9
                    HStack(spacing:0){
                        Text ("3456")
                            .frame(width:geo.size.width * 0.15)
                        Text("36")
                            .frame(width:geo.size.width * 0.065)
                    }
                    .foregroundColor(darkTeal)
                    .fontWeight(.semibold)
                    
                    
                    
                    
                    // players front 9 totals
                    HStack(spacing: 0){
                        Text("47")
                            .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                        Text("34")
                            .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                        Text("40")
                            .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                        Text("39")
                            .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                    }
                    .offset(x: geo.size.width * 0.085)
                    .foregroundColor(darkTeal)
                    .fontWeight(.semibold)
                    
                }
                
                
                
                ForEach(9..<18){i in
                    HStack(spacing:0){
                        //Text(scoreEntryVM.currentGame.game.scoreEntryTeeBox?.holesArray[i].number.formatted() ?? "")
                        Text((i+1).formatted())
                            .frame(width: geo.size.width * 0.05, height: geo.size.height * 0.03)
                            .foregroundColor(darkTeal)
                        //Text(scoreEntryVM.currentGame.game.scoreEntryTeeBox?.holesArray[i].distance.formatted() ?? "")
                        Text("377")
                            .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.03)
                            .foregroundColor(darkTeal)
                        //Text(scoreEntryVM.currentGame.game.scoreEntryTeeBox?.holesArray[i].par.formatted() ?? "")
                        Text("5")
                            .frame(width: geo.size.width * 0.05, height: geo.size.height * 0.03)
                            .foregroundColor(darkTeal)
                        //Text(scoreEntryVM.currentGame.game.scoreEntryTeeBox?.holesArray[i].strokeIndex.formatted() ?? "")
                        Text("15")
                            .frame(width: geo.size.width * 0.075, height: geo.size.height * 0.03)
                            .foregroundColor(burntOrange)
                    }
                }
                
                // players back 9 totals
                HStack(spacing:0){
                    //hole summary front 9
                    HStack(spacing:0){
                        Text ("3456")
                            .frame(width:geo.size.width * 0.15)
                        Text("36")
                            .frame(width:geo.size.width * 0.065)
                    }
                    .foregroundColor(darkTeal)
                    .fontWeight(.semibold)
                    
                    
                    
                    
                    // players front 9 totals
                    HStack(spacing: 0){
                        Text("47")
                            .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                        Text("34")
                            .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                        Text("40")
                            .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                        Text("39")
                            .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                    }
                    .offset(x: geo.size.width * 0.085)
                    .foregroundColor(darkTeal)
                    .fontWeight(.semibold)
                    
                }
                
                // players front 9 totals
                HStack(spacing:0){
                    //hole summary front 9
                    HStack(spacing:0){
                        Text ("3456")
                            .frame(width:geo.size.width * 0.15)
                        Text("36")
                            .frame(width:geo.size.width * 0.065)
                    }
                    .foregroundColor(darkTeal)
                    .fontWeight(.semibold)
                    
                    
                    
                    
                    // players front 9 totals
                    HStack(spacing: 0){
                        Text("47")
                            .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                        Text("34")
                            .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                        Text("40")
                            .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                        Text("39")
                            .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                    }
                    .offset(x: geo.size.width * 0.085)
                    .foregroundColor(darkTeal)
                    .fontWeight(.semibold)
                    
                }
                
                // players  totals
                HStack(spacing:0){
                    //hole summary front 9
                    HStack(spacing:0){
                        Text ("3456")
                            .frame(width:geo.size.width * 0.15)
                        Text("36")
                            .frame(width:geo.size.width * 0.065)
                    }
                    .foregroundColor(darkTeal)
                    .fontWeight(.semibold)
                    
                    
                    
                    
                    // players front 9 totals
                    HStack(spacing: 0){
                        Text("47")
                            .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                        Text("34")
                            .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                        Text("40")
                            .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                        Text("39")
                            .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                    }
                    .offset(x: geo.size.width * 0.085)
                    .foregroundColor(darkTeal)
                    .fontWeight(.semibold)
                    
                }
                
                
                
                HStack(spacing: 0){
                    Group{
                        Text("PN")
                          
                        Text("JD")
                            
                        Text("PN")
                            
                        Text("JD")
                            
                    }
                    .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.03)
                }
                .offset(x: geo.size.width * 0.28)
                .foregroundColor(darkTeal)
                
            }
            
            
        }
    }
}

struct ScorecardScreen_Previews: PreviewProvider {
    static var previews: some View {
        
        ScorecardScreen()
            .environmentObject(ScoreEntryViewModel())
    }
}
