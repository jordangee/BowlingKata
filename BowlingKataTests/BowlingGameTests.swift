//
//  BowlingGameTests.swift
//  BowlingKataTests
//
//  Created by jordan.griffin on 11/29/17.
//  Copyright © 2017 JGriff. All rights reserved.
//

import XCTest
@testable import BowlingKata

class BowlingTests2: XCTestCase {
    
    var game = BowlingGame2()
    
    override func setUp() {
        super.setUp()
        game.rolls.removeAll()
        game.currentRoll = 0
    }
    
    func testGutterGame() {
        rollMany(count: 20, pins: 0)
        
        checkScore(expectedScore: 0, actualScore: game.getScore())
    }
    
    func testAllOnes() {
        rollMany(count: 20, pins: 1)
        
        checkScore(expectedScore: 20, actualScore: game.getScore())
    }
    
    func testOneSpare() {
        rollSpare()
        game.roll(pins: 3)
        rollMany(count: 17, pins: 0)
        
        checkScore(expectedScore: 16, actualScore: game.getScore())
    }
    
    func testOneStrike() {
        rollStrike()
        game.roll(pins: 3)
        game.roll(pins: 4)
        rollMany(count: 16, pins: 0)
        
        checkScore(expectedScore: 24, actualScore: game.getScore())
    }
    
    func testPerfectGame() {
        rollMany(count: 12, pins: 10)
        
        checkScore(expectedScore: 300, actualScore: game.getScore())
    }
    
    func rollMany(count: Int, pins: Int) {
        for _ in 0..<count {
            game.roll(pins: pins)
        }
    }
    
    func rollSpare() {
        game.roll(pins: 5)
        game.roll(pins: 5)
    }
    
    func rollStrike() {
        game.roll(pins: 10)
    }
    
    func checkScore(expectedScore: Int, actualScore: Int) {
        XCTAssert(expectedScore == actualScore, "Score of \(expectedScore) expected, but was \(actualScore)")
    }
}
