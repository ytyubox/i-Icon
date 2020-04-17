//
//  String+.swift
//  iIcon
//
//  Created by 游宗諭 on 2020/4/17.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import Foundation
import AppKit.NSFont
import SwiftUI

struct FontGetter {
  let text:String
  func font(in size: CGSize)-> CGFloat {
    let string = text
    let standard = min(size.width, size.height)
    let min = 4
    let max = 30
    for i in min...max {
      let strSize = string
        .size(withAttributes: [NSAttributedString.Key.font: NSFont.systemFont(ofSize: CGFloat(i))])
      //      let linesNumber = Int(size.height/strSize.height)
      if standard < strSize.height {
        return CGFloat(i-1)
      }
    }
    return  CGFloat(max)
  }
  
  func font(in size: CGSize)-> Font {
    .system(size: font(in: size))
  }
}
