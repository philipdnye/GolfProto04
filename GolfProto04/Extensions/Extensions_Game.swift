//
//  Extensions_Game.swift
//  GolfProto03
//
//  Created by Philip Nye on 14/04/2023.
//

import Foundation


extension Game {
    var sc_format: ScoreFormat {
        get{
            return ScoreFormat(rawValue: Int(self.scoreFormat)) ?? .medal
        } set {
            self.scoreFormat = Int16(newValue.rawValue)
        }
    }
}
extension Game {
    var hcap_format: HandicapFormat {
        get{
            return HandicapFormat(rawValue: Int(self.handicapFormat)) ?? .handicap
        } set {
            self.handicapFormat = Int16(newValue.rawValue)
        }
    }
}
extension Game {
    var play_format: PlayFormat {
        get{
            return PlayFormat(rawValue: Int(self.playFormat)) ?? .strokeplay
        } set {
            self.playFormat = Int16(newValue.rawValue)
        }
    }
}

extension Game {
    var game_format: GameFormatType {
        get{
            return GameFormatType(rawValue: Int(self.gameFormat)) ?? .fourBallBBMatch
        } set {
            self.gameFormat = Int16(newValue.rawValue)
        }
    }
}


extension Game {
    var game_duration: GameDuration {
        get {
            return GameDuration(rawValue: Int(self.duration)) ?? .H18
        } set {
            self.duration = Int16(newValue.rawValue)
        }
    }
}

extension Game {
    func TeeBoxesAllSame() -> Bool {
        var teeBoxes: [TeeBox] = []
        for i in 0..<self.competitorArray.count {
            teeBoxes.append(self.competitorArray[i].teeBox ?? TeeBox())
        }
        let hasAllItemsEqual = teeBoxes.dropFirst().reduce(true) { (partialResult, element) in
            return partialResult && element == teeBoxes.first
        }
        return hasAllItemsEqual
    }
}

extension Game {
    func TotalPlayingHandicapA () -> Double {
        if !self.teamShotsArray.isEmpty{
            let totalPHA = Double(self.teamShotsArray[0].playingHandicap + self.teamShotsArray[0].diffTeesXShots)
            
            return totalPHA
        } else {
            return 0.0
        }
    }
}
extension Game {
    func TotalPlayingHandicapB () -> Double {
        if !self.teamShotsArray.isEmpty{
            let totalPHB = Double(self.teamShotsArray[1].playingHandicap + self.teamShotsArray[1].diffTeesXShots)
            
            return totalPHB
        } else {
            return 0.0
        }
    }
}
extension Game {
    func TotalPlayingHandicapC () -> Double {
        if !self.teamShotsArray.isEmpty{
            let totalPHC = Double(self.teamShotsArray[2].playingHandicap + self.teamShotsArray[2].diffTeesXShots)
            
            return totalPHC
        } else {
            return 0.0
        }
    }
}
//extension Game {
//    func TotalShotsRecdMatchTeamA () -> Double {
//        let totalSR = Double(self.teamAShotsReceived + self.teamADiffTeesXShots)
//        return totalSR
//    }
//}

//extension Game {
//    func TotalShotsRecdMatchTeamB () -> Double {
//        let totalSR = Double(self.teamBShotsReceived + self.teamBDiffTeesXShots)
//        return totalSR
//    }
//}

extension Game {
    func TotalShotsRecdMatchTeamA () -> Double {
        if !self.teamShotsArray.isEmpty{
            let totalSR = Double(self.teamShotsArray[0].shotsRecd + self.teamShotsArray[0].diffTeesXShots)
            
            return totalSR
        } else {
            return 0.0
        }
    }
}
extension Game {
    func TotalShotsRecdMatchTeamB () -> Double {
        if !self.teamShotsArray.isEmpty{
            let totalSR = Double(self.teamShotsArray[1].shotsRecd + self.teamShotsArray[1].diffTeesXShots)
            
            return totalSR
        } else {
            return 0.0
        }
    }
}
