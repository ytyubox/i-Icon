//
//  Row.swift
//  iIcon
//
//  Created by 游宗諭 on 2020/4/17.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import SwiftUI
struct Row<InputView>:View where InputView: View {
  internal init(_ text: String,
                @ViewBuilder inputView: () -> InputView) {
    self.text = text
    self.inputView = inputView()
  }
  
  let text:String
  var inputView:InputView
  var body: some View {
    HStack {
      Label(text)
      inputView
    }
  }
}


struct Row_Previews: PreviewProvider {
    static var previews: some View {
      Row("some") {
        Text("thing")
      }
    }
}
