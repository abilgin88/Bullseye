//
//  RoundedView.swift
//  BullsEye
//
//  Created by Abdullah Bilgin on 4/13/23.
//

import SwiftUI

// create a struct for stroke view
struct RoundedImageViewStroked: View {
  // define a variable for symbol
  var systemName: String
  var body: some View {
    VStack{
      // add dynamic image for symbols
      Image(systemName: systemName)
      //modifying the symbol
        .font(.title)
        .foregroundColor(Color("TextColor"))
        .frame(width: 56, height: 56)
      //  apply an overlay to image
        .overlay(
          Circle()
            .strokeBorder(Color("ButtonStrokeColor") , lineWidth: 2)
        )
    }
  }
}

// create a struct for filled view
struct RoundedImageViewFilled: View {
  // define a variable for symbol
  var systemName: String
  var body: some View {
    VStack{
      // add dynamic image for symbols
      Image(systemName: systemName)
      //modifying the symbol
        .font(.title)
      // apple ButtonFilledTextColor for the text in the filled view
        .foregroundColor(Color("ButtonFilledTextColor"))
        .frame(width: 56, height: 56)
      // apply background to the image that applies a circle that is filled
        .background(
          Circle()
            .fill(Color("ButtonFilledBackgroundColor")))
    }
  }
}


// create a struct for stroke view
struct RoundRectTextView: View {
  var text: String
  
  var body: some View {
      Text(text)
        .kerning(0.2)
        .bold()
        .font(.title3)
        .frame(width: 68, height: 56)
        .foregroundColor(Color("TextColor"))
        .overlay(
          RoundedRectangle(cornerRadius: 21)
            .stroke(lineWidth: 2)
            .foregroundColor(Color("ButtonStrokeColor"))
        )
  }
}

// create a preview to preview reset and leaderboard symbol
struct PreviewView: View {
  var body: some View {
    //embed reset and leaderboard preview with space
    VStack(spacing: 10) {
      RoundedImageViewFilled(systemName: "arrow.counterclockwise")
      RoundedImageViewStroked(systemName: "list.dash")
      RoundRectTextView(text: "100")
    }
  }
}

struct RoundedView_Previews: PreviewProvider {
  static var previews: some View {
    // create two preview for light and dark mode from PreviewView that create above
    PreviewView()
    PreviewView()
      .preferredColorScheme(.dark)
  }
}