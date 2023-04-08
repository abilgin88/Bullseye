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
        Slider(value: .constant(50), in: 1.0 ... 100.0)
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
          Text("This is my first alert")
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
