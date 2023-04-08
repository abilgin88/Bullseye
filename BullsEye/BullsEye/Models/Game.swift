//
//  Game.swift
//  BullsEye
//
//  Created by Abdullah Bilgin on 4/8/23.
//

import Foundation
//create a new game struct
struct Game {
  var target: Int = Int.random(in: 1...100)
  var score: Int = 0
  var round: Int = 1
  
  //  Create a method for calculating points
  func point(sliderValue: Int) -> Int {
    // create a local variable inside this method called the difference
    var difference: Int
    
    // if-else based on our plain-english algorithm
    if sliderValue > target {
      difference = sliderValue - target
    } else if target > sliderValue {
      difference = target - sliderValue
    } else {
      difference = 0
    }
    
    // create a local variable inside this method called the awardedPoints
    var awardedPoints: Int = 100 - difference
    return awardedPoints
  }
}
