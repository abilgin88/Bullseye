//
//  ContentView.swift
//  BullsEye
//
//  Created by Abdullah Bilgin on 4/8/23.
//

import SwiftUI

struct ContentView: View {
  // add a new property that stores whether or not alert is visible.
  @State private var alertIsVisible = false
  //State variable to keep track of the slider's value.
  @State private var sliderValue = 50.0
  // creates a new instance of that template game ContentView
  @State private var game = Game()
  
  var body: some View {
    ZStack {
      // add background view (remove here color and  safe area, because background view include them)
      BackgroundView(game: $game)
      VStack {
        // call instruction-view and pass game data in it. (Now we have single line here:))
        InstructionsView(game: $game)
          .padding(.bottom, 100)
        // HitMeButton view
        HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
      }
      // call Slider-View and move the bottom of content view to center it
      Sliderview(sliderValue: $sliderValue)
    }
  }
}




// Combine Instruction and Big Number views in a single View
struct InstructionsView: View {
  // passing game data from content-view
  @Binding var game: Game
  
  var body: some View {
    VStack {
      // call instruction text view from textView file
      InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
        .padding(.horizontal, 30)
      
      // call big number text view from textView file
      BigNumberText(text: String(game.target))
    }
  }
}

// Create a new view for slider
struct Sliderview: View {
  @Binding var sliderValue: Double
  
  var body: some View {
    HStack {
      // call slider-label-text from textView file
      SliderLabelText(text: "1")
      // centered slider icon
        .frame(width: 35)
      // Add a slider and make it go between the values 1 and 100
      Slider(value: $sliderValue, in: 1.0 ... 100.0) // binding the slider-value
      // call slider-label-text from textView file
      SliderLabelText(text: "100")
      // centered slider icon
        .frame(width: 35)
    }
    .padding()
  }
}

// Create a new view for Hit-Me button

struct HitMeButton: View {
  // Pass the variables
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    // Add a button for hit me
    Button("Hit Me".uppercased()) {
      // gets run when the user taps the Hit Me button.
      alertIsVisible = true
    }
    //Styling the button
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtonColor")
        LinearGradient(
          gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
          startPoint: .top, endPoint: .bottom)
      }
    )
    // overlay the button
    .overlay(
      RoundedRectangle(cornerRadius:21.0)
        .strokeBorder(Color.white, lineWidth: 2.0)
    )
    .foregroundColor(.white)
    .cornerRadius(21.0)
    .bold()
    .font(.title3)
    //call alert method on the resulting button
    .alert(
      "Hello there",
      isPresented: $alertIsVisible,
      actions: {
        Button("Awesome") {
          // call the startNewRound (First we put the "Hit Me" Button and we debugger and move here to fix problem 
          game.startNewRound(points: game.point(sliderValue: Int(sliderValue)))
        }
      },
      message: {
        // make temporary variables convert value and rounded it
        let roundedValue = Int(sliderValue.rounded())
        
        // show users what their score is after they’ve tapped the “Hit Me” button
        Text("""
          The slider's value is \(roundedValue)
          You scored \(game.point(sliderValue: roundedValue)) points this round.
        """)
      }
    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .preferredColorScheme(.dark)
      .previewDevice("iPhone 14 Pro Max")
  }
}
