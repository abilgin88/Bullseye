//
//  TextViews.swift
//  BullsEye
//
//  Created by Abdullah Bilgin on 4/10/23.
//

import SwiftUI

// Create instruction Text view and move content from content view (extract views)
struct InstructionText: View {
  // create a variable to pass data when we need to use in our apps
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .bold()
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.footnote)
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
  }
}

// Create BigNumber Text  view and move content from content view (extract views)
struct BigNumberText: View {
  // create a variable to pass data when we need to use in our apps
  var text: String
  
  var body: some View {
    Text(text)
      .kerning(-1.0)
      .font(.largeTitle)
      .fontWeight(.black)
      .foregroundColor(Color("TextColor"))
  }
}

// create a slider label text view
struct SliderLabelText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color("TextColor"))
  }
}

// Create a label text view to style Score and Round Text
struct LabelText: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .kerning(1.5)
      .font(.caption)
      .bold()
      .foregroundColor(Color("TextColor"))
  }
}

// Create a Body Text View
struct BodyText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .font(.subheadline)
      .fontWeight(.semibold)
      .multilineTextAlignment(.center)
      .lineSpacing(12)
    //.foregroundColor(Color("TextColor"))
    
  }
}

// Create a Button Text View for alert button
struct ButtonText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        Color.accentColor
      )
      .foregroundColor(.white)
      .cornerRadius(12)
  }
}


// Creating a score text view and modify
struct ScoreText: View {
  var score: Int
  
  var body: some View {
    Text(String(score))
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
  }
}

// create a date text view, modify and set the date
struct DateText: View {
  var date: Date
  
  var body: some View {
    // defining Text style property for defining the current date
    Text(date, style: .time)
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
      //Replace the hard-coded size argument with constant from enum
      .frame(width: Constants.Leaderboard.dateColumnWidth)
  }
}

// Create a text call BigBoldText view for Header View
struct BigBoldText: View {
  var text: String
  
  var body: some View {
    // defining Text style property for defining the current date
    Text(text.uppercased())
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
      .font(.title)
      .fontWeight(.black)
  }
}


struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    // Embed both instruction and big number preview
    VStack {
      InstructionText(text: "Instructions")
      BigNumberText(text: "999")
      SliderLabelText(text: "99")
      LabelText(text: "Score")
      BodyText(text: "You scored 200 Points\n 🎉🎉🎉")
      ButtonText(text: "Start New Round")
      // Showing up the score and date in the preview
      ScoreText(score: 459)
      DateText(date: Date())
      BigBoldText(text: "leaderboard")
    }
    .padding()
  }
}
