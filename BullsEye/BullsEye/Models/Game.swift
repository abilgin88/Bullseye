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
  //  Define an array for leaderboard entries
  var leaderboardEntries: [LeaderboardEntry] = []
  
  // 6
  init(loadTestData: Bool = false) {
    if loadTestData {
      addToLeaderboard(score: 100)
      addToLeaderboard(score: 80)
      addToLeaderboard(score: 200)
      addToLeaderboard(score: 50)
      addToLeaderboard(score: 20)
    }
  }

  
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
    addToLeaderboard(score: points)
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
  
  //  Create a mutating method for adding score and date for the Leaderboardenries
  mutating func addToLeaderboard(score: Int) {
    // Add items and sort them
    leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
    leaderboardEntries.sort { entry1, entry2 in
      entry1.score > entry2.score
    }
  }
}

// Create a struct for the data model
struct LeaderboardEntry {
  let score: Int
  let date: Date
}

