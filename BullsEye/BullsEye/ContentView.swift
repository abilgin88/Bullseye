//
//  ContentView.swift
//  BullsEye
//
//  Created by Abdullah Bilgin on 4/8/23.
//

import SwiftUI

struct ContentView: View {
  // add a new property that stores whether or not alert is visible.
  @State private var alertIsVisible: Bool = false
  
  //State variable to keep track of the slider's value.
  @State private var sliderValue: Double = 20.0

  
  var body: some View {
    VStack {
      // Add an instructions label
      Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .bold()
        .multilineTextAlignment(.center)
        .lineSpacing(4.0)
        .font(.footnote)
        .kerning(2.0)
      //Add a target value
      Text("89")
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
      // Add a button for hit me
      Button("Hit Me") {
        // gets run when the user taps the Hit Me button.
        alertIsVisible = true
      }
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
          let roundedValue: Int = Int(sliderValue.rounded())
          
          // modify massage with rounded slider value
          Text("The slider's value is \(roundedValue)")
        }
      )
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
