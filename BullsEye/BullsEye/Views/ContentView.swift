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
      Color("BackgroundColor")
        .ignoresSafeArea()
      VStack {
        // Add an instructions label
        Text("🎯🎯🎯\nPut the Bullseye as close as you can to".uppercased())
          .bold()
          .multilineTextAlignment(.center)
          .lineSpacing(4.0)
          .font(.footnote)
          .kerning(2.0)
          .padding(.horizontal, 30)
        // Instead of showing the hard-coded 89, display the target from the game property.
        Text(String(game.target))
          .kerning(-1.0)
          .font(.largeTitle)
          .fontWeight(.black)
        HStack {
          // Add slider right side
          Text("1")
            .bold()
          // Add a slider and make it go between the values 1 and 100
          Slider(value: $sliderValue, in: 1.0 ... 100.0) // binding the slidervalue
          // Add slider right side
          Text("100")
            .bold()
        }
        .padding()
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
              print("Alert closed")
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
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
