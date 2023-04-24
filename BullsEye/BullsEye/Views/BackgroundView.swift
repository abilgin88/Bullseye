//
//  BackgroundView.swift
//  BullsEye
//
//  Created by Abdullah Bilgin on 4/14/23.
//

import SwiftUI

// create a background view for top-view, bottom-view, background color and ignore safe area
struct BackgroundView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      TopView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding()
    .background(
      RingView() // call the ring view
    )
  }
}

// create a top-view
struct TopView: View {
  @Binding var game: Game
  // Add state variable for leaderboardIsShowing and set false to TopView
  @State private var leaderboardIsShowing = false
  
  var body: some View {
    HStack {
      // Add action to start over the button and call the restart method when tapping it
      Button {
        game.restart()
      } label: {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      }
      Spacer()
      //Make the roundedImageViewFilled into a button from the background view
      Button {
        // when button tap set the leaderboardIsShowing to true
        leaderboardIsShowing = true
        
      } label: {
        RoundedImageViewFilled(systemName: "list.dash")
      }
      // call the sheet method(binding the value here) and add leaderboardview to show
      .sheet(isPresented: $leaderboardIsShowing) {
        LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing)
      }
      
    }
  }
}

// create a number view for score and round
struct NumberView: View {
  var title: String
  var text: String
  
  var body: some View {
    VStack(spacing: 5) {
      LabelText(text: title)
      RoundRectTextView(text: text)
    }
  }
}

// create a bottom view for numbers
struct BottomView: View {
  @Binding var game: Game
  
  var body: some View {
    HStack {
      NumberView(title: "Score", text: (String(game.score)))
      Spacer()
      NumberView(title: "Round", text: (String(game.round)))
    }
  }
}

// Create a ring view to add circle to background
struct RingView: View {
  //create an environment variable
  @Environment (\.colorScheme) var colorScheme
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea()
      ForEach(1..<6) { ring in
        let size = CGFloat(ring * 100)
        // create a conditional for dark and light mode
        let opacity = colorScheme == ColorScheme.dark ? 0.1 : 0.3
        Circle()
          .stroke(lineWidth: 20)
          .fill(
            RadialGradient(
              gradient: Gradient(colors: [Color("RingsColor").opacity(opacity * 0.8), Color("RingsColor").opacity(0)]),
              center: .center,
              startRadius: 100, endRadius: 300))
          .frame(width: size, height: size)
      }
     
    }
  }
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    // add game temp gama parameter
    BackgroundView(game: .constant(Game()))
  }
}
