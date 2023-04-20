//
//  PointViews.swift
//  BullsEye
//
//  Created by Abdullah Bilgin on 4/20/23.
//

import SwiftUI

struct PointViews: View {
  // Passing the variables
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    // define actual values to pass in to the alert message
    let roundedValues = Int(sliderValue.rounded())
    let points = game.point(sliderValue: roundedValues)
    
    VStack(spacing: 10) {
      InstructionText(text: "The Slider's Value is")
      BigNumberText(text: String(roundedValues))
      BodyText(text: "You scored \(points) Points\n 🎉🎉🎉")
      Button {
        // to animate
        withAnimation {
          // call the method to dismiss and save the points and raound
          alertIsVisible = false
        }
        game.startNewRound(points: points)
      } label: {
        ButtonText(text: "Start New Round")
      }
    }
    // modifying the custom popup
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(21)
    .shadow(radius: 10, x: 5, y: 5)
  }
}

struct PointViews_Previews: PreviewProvider {
  // temporary variable to show on previews
  static private var alertIsVisible = Binding.constant(false)
  static private var sliderValue = Binding.constant(50.0)
  static private var game = Binding.constant(Game())

  static var previews: some View {
    // pass the constant temporary values to preview
    PointViews(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
    PointViews(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
      .previewInterfaceOrientation(.landscapeRight)
      .preferredColorScheme(.dark)
  }
}
