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


struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    // Embed both instruction and big number preview
    VStack {
      InstructionText(text: "Instructions")
      BigNumberText(text: "999")
      SliderLabelText(text: "99")
    }
    
  }
}
