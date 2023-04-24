//
//  LeaderboardView.swift
//  BullsEye
//
//  Created by Abdullah Bilgin on 4/23/23.
//

import SwiftUI

struct LeaderboardView: View {
  var body: some View {
    // embed in VStack and spacing
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea()
      VStack(spacing: 10) {
        // Shoving HeaderView
        HeaderView()
        LabelView()
        // Showing the Row View
        RowView(index: 1, score : 10, date: Date())
      }
    }
  }
}

// Create the  Header View
struct HeaderView: View {
  //access the environment in the header view and create the vertical and horizontal variables
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  var body: some View {
    ZStack {
      // embed bigBoldText view in HStack
      HStack {
        BigBoldText(text: "Leaderboard")
        // apply conditional for portrait to check portrait environment size
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
          Spacer()
        }
      }
      // add X button in the header view to close the leaderboard
      HStack {
        Spacer()
        // Create a butto
        Button {
          //
        } label: {
          // show the rounded image filled from rounded view we have and change the image to x
          RoundedImageViewFilled(systemName: "xmark")
        }
      }
    }
    .padding()
  }
}

// Create the  Label View
struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText(text: "Score")
        .frame(width: Constants.Leaderboard.scoreColumnWidth)
      Spacer()
      LabelText(text: "Date")
        .frame(width: Constants.Leaderboard.dateColumnWidth)
    }
    .padding(.horizontal)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
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

