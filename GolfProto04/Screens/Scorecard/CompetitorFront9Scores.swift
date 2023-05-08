//
//  CompetitorFront9Scores.swift
//  GolfProto04
//
//  Created by Philip Nye on 08/05/2023.
//

import SwiftUI

struct CompetitorFront9Scores: View {
    var competitor: Competitor
    var body: some View {
        
        ZStack{
            Text(competitor.competitorScoresArray.TotalGrossScore_front9().formatted())
                .foregroundColor(.blue)
            Text(competitor.competitorScoresArray.TotalStablefordPoints_front9().formatted())
                .foregroundColor(burntOrange)
                .font(.caption)
                .offset(x: 15, y: 10)
        }
    }
}

struct CompetitorFront9Scores_Previews: PreviewProvider {
    static var previews: some View {
        CompetitorFront9Scores(competitor: Competitor())
    }
}
