//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Abdullah Bilgin on 4/8/23.
//

import XCTest

// import our Bullseye code into this file
@testable import BullsEye

final class BullsEyeTests: XCTestCase {
  // create an instance of our game struct.
  var game: Game!
  
    override func setUpWithError() throws {
      // set this game property to an instance of our game
      game = Game()
    }

    override func tearDownWithError() throws {
      // get rid of the value of the game property
      game = nil
    }

    func testExample() throws {
      // call XCTAssertEqual. This is saying these two values that you pass in should be the same.
      XCTAssertEqual(game.point(sliderValue: 50), 999)
    }


}
