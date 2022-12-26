//
//  Score.swift
//  GolfApp
//
//  Created by Tyler Fontana on 11/26/22.
//

import Foundation


struct Hole: Decodable{
    var holeNum: Int
    var par: Int
    var strokes: Int
}

struct RoundTotal: Identifiable{
    var id = UUID()
    var roundPlayed = [Hole]()
    var courseName: String = ""
    var numHoles: Int?
    var coursePar: Int = 0
    var courseRating: Int = 0
    var courseSlope: Int = 0
    var totalStrokes : Int = 0
    var handicapDifferentials : Int?
    var courseHandicap : Int?
}
