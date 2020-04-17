//
//  Icon.swift
//  iIcon
//
//  Created by 游宗諭 on 2020/4/16.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import SwiftUI
struct Icon:View {
  init(
    _ text: Binding<String>,
    fg fgcolor: Binding< Color>,
    bg bgcolor: Binding< Color>) {
    self._text = text
    self._fgcolor = fgcolor
    self._bgcolor = bgcolor
  }
  @Binding var text:String
  @Binding var fgcolor: Color
  @Binding var bgcolor: Color
  let basicFontSize: CGFloat = 30
  var lineLayer :CGFloat {CGFloat(text.filter{$0 == "\n"}.count) }
  var body: some View {
    
    GeometryReader{g in
      
      Text(self.text)
        
        .frame(width: g.size.width,height: g.size.width)
        .font(FontGetter(text: self.text).font(in: g.size))
        .foregroundColor(self.fgcolor)
        .background(self.bgcolor)
        .cornerRadius(25)
    }
  }
}
struct Icon_Previews: PreviewProvider {
  static var previews: some View {
    Icon(.constant("title"),
         fg: .constant(.white),
         bg: .constant(.black))
  }
}



