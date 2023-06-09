//
//  LeaderboardView.swift
//  BullsEye
//
//  Created by Abdullah Bilgin on 4/23/23.
//

import SwiftUI

struct LeaderboardView: View {
  // binding the leaderboardIsShowing
  @Binding var leaderboardIsShowing: Bool
  // Binding game to the leaderboard
  @Binding var game: Game
  
  var body: some View {
    // embed in VStack and spacing
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea()
      VStack(spacing: 10) {
        // pass leaderboardIsShowing to header view
        HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
        LabelView()
        // Embed the rowView in the scrollview
        ScrollView {
          // Embed RowView in the VStack and add space
          VStack(spacing: 10) {
            // Create forEach for iterate the data LeaderboardEntries
            ForEach(game.leaderboardEntries.indices,
                    id: \.self) { index in
              let leaderboardEntry = game.leaderboardEntries[index]
              // Showing the Row Views
              RowView(index: index + 1, score : leaderboardEntry.score, date: leaderboardEntry.date)
            }
          }
        }
      }
    }
  }
}

// Create the  Header View
struct HeaderView: View {
  //access the environment in the header view and create the vertical and horizontal variables
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  // binding the leaderboardIsShowing
  @Binding var leaderboardIsShowing: Bool
  
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
          // set leaderboardIsShowing to false when X tap
          leaderboardIsShowing = false
        } label: {
          // show the rounded image filled from rounded view we have and change the image to x
          RoundedImageViewFilled(systemName: "xmark")
        }
      }
    }
    .padding([.horizontal, .top]) // Add padding to HeaderView
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
  // pass leaderboardIsShowing to preview and create a static constant variable
  static private var leaderboardIsShowing = Binding.constant(false)
  // create a constant and pass the game binding value to the previews
  static private var game = Binding.constant(Game(loadTestData: true)) // set the constant to true to show instant data
  
  static var previews: some View {
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .previewInterfaceOrientation(.landscapeRight)
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)      .preferredColorScheme(.dark)
  }
}

