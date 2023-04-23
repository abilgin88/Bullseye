//
//  LeaderboardView.swift
//  BullsEye
//
//  Created by Abdullah Bilgin on 4/23/23.
//

import SwiftUI

struct LeaderboardView: View {
  var body: some View {
    // Showing the Row View
    RowView(index: 1, score: 10, date: Date())
  }
}

// create a row view
struct RowView: View {
  // set three parameter that shoe inside the row
  let index: Int
  let score: Int
  let date: Date
  
  var body: some View {
    // implement RoundedTextView, ScoreText, and DateText and use them in the leaderboard
    HStack {
      RoundedTextView(text: String(index))
      Spacer()
      ScoreText(score: score)
      // Apply a frame view modifier to scoreText and DateText
        .frame(width: Constants.Leaderboard.scoreColumnWidth)
      Spacer()
      DateText(date: Date())
      // Apply a frame view modifier to scoreText and DateText
        .frame(width: Constants.Leaderboard.dateColumnWidth)
    }
    //add background and size it
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderboardRowColor"),
                      lineWidth: Constants.General.strokeWidth)
    )
    .padding(.horizontal)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}

// create another leaderboard preview for dark mode attributes
struct LeaderboardView_Previews: PreviewProvider {
  static var previews: some View {
    LeaderboardView()
      .previewInterfaceOrientation(.landscapeRight)
    LeaderboardView()
      .preferredColorScheme(.dark)
  }
}

