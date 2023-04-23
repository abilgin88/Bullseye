//
//  Constants.swift
//  BullsEye
//
//  Created by Abdullah Bilgin on 4/20/23.
//

import Foundation

// Create enum for constant and general numbers.
enum Constants {
  enum General {
    //defining variable for each magic number
    public static let strokeWidth = CGFloat(2)
    public static let roundedViewLength = CGFloat(56)
    public static let roundedRectViewWidth = CGFloat(68)
    public static let roundedRectViewHeight = CGFloat(56)
    public static let roundedRectCornerRadius = CGFloat(21)
  }
  //defining enum for leaderboard magic number
  enum Leaderboard {
    public static let scoreColumnWidth = CGFloat(50)
    public static let dateColumnWidth = CGFloat(170)
    public static let maxRowWidth = CGFloat(480)
  }
}
