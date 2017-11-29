//
//  BowlingGame.swift
//  BowlingKata
//
//  Created by jordan.griffin on 11/29/17.
//  Copyright © 2017 JGriff. All rights reserved.
//

import Foundation

class BowlingGame2 {
    var rolls = [Int]()
    var currentRoll = 0
    
    func roll(pins: Int) {
        rolls.append(pins)
        currentRoll += 1
    }
    
    func getScore() -> Int {
        var score = 0
        var frameIndex = 0
        
        for _ in 0..<10 {
            do {
                let checkSpare = try isSpare(frameIndex)
                
                if isStrike(frameIndex) {
                    score += (10 + rolls[frameIndex+1] + rolls[frameIndex+2])
                    frameIndex += 1
                } else if checkSpare {
                    score += (10 + rolls[frameIndex+2])
                    frameIndex += 2
                } else {
                    score += (rolls[frameIndex] + rolls[frameIndex+1])
                    frameIndex += 2
                }
            } catch let error {
                print("\(error)")
            }
        }
        
        return score
    }
    
    func isSpare(_ frameIndex: Int) throws -> Bool {
        guard rolls.indices.contains(frameIndex+1) else {
            throw NSError(domain: "index does not exist in array", code: 1)
        }
        
        return rolls[frameIndex] + rolls[frameIndex+1] == 10
    }
    
    func isStrike(_ frameIndex: Int) -> Bool {
        return rolls[frameIndex] == 10
    }
}
