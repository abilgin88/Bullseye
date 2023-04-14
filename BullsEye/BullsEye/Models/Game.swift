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
     100 - abs(target - sliderValue)
  }
  
    // create a method to start new round
  mutating func startNewRound(points: Int) {
    score += points
    round += 1
  }
}
