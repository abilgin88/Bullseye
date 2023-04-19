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
  
  // add one where the slider value is greater than the target value.
  func testScorePositive() {
    let guess = game.target + 5
    let score = game.point(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  // add a second test where the slider value is less than the target value
  func testScoreNegative() {
    let guess = game.target - 5
    let score = game.point(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  // for exact 100
  func testScoreExact() {
    let guess = game.target
    let score = game.point(sliderValue: guess)
    XCTAssertEqual(score, 200)
  }
  
  // for close
  func testScoreClose() {
    let guess = game.target + 2
    let score = game.point(sliderValue: guess)
    XCTAssertEqual(score, 98 + 50)
    
    
    // add test for the score and round
    
    func testNewRound() {
      game.startNewRound(points: 100)
      XCTAssertEqual(game.score, 100)
      XCTAssertEqual(game.round, 2)
    }
  }
}
