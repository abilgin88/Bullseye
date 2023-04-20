//
//  PointViews.swift
//  BullsEye
//
//  Created by Abdullah Bilgin on 4/20/23.
//

import SwiftUI

struct PointViews: View {
  var body: some View {
    VStack(spacing: 10) {
      InstructionText(text: "The Slider's Value is")
      BigNumberText(text: "50")
      BodyText(text: "You scored 200 Points\n 🎉🎉🎉")
      Button {
        // start new round
      } label: {
        ButtonText(text: "Start New Round")
      }
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(21)
    .shadow(radius: 10, x: 5, y: 5)
  }
}

struct PointViews_Previews: PreviewProvider {
  static var previews: some View {
    PointViews()
    PointViews()
      .previewInterfaceOrientation(.landscapeRight)
      .preferredColorScheme(.dark)
  }
}
