//
//  Game.swift
//  BullsEye
//
//  Created by Abdullah Bilgin on 4/8/23.
//

import Foundation
//create a new game struct
struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  
  //  Create a method for calculating points
  func point(sliderValue: Int) -> Int {
    let difference = abs(target - sliderValue)
    let bonus: Int
    
    if difference == 0 {
      bonus  = 100
    } else if difference <= 2 {
      bonus = 50
    } else {
      bonus = 0
    }
    return 100 - difference + bonus
  }
  
  // create a method to start new round
  mutating func startNewRound(points: Int) {
    // after start the score and round will update
    score += points
    round += 1
    // for create a new random number
    target = Int.random(in: 1...100)
  }
  
  // create a method to reset the app
  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 1...100)
  }
}
