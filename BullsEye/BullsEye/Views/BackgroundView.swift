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
      Color("BackgroundColor")
        .ignoresSafeArea()
    )
  }
}

// create a top-view
struct TopView: View {
  @Binding var game: Game
  var body: some View {
    HStack {
      // Add action to start over the button and call the restart method when tapping it
      Button {
        game.restart()
      } label: {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      }
      Spacer()
      RoundedImageViewFilled(systemName: "list.dash")
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


struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    // add game temp gama parameter
    BackgroundView(game: .constant(Game()))
  }
}
