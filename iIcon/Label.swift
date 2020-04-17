//
//  Label.swift
//  iIcon
//
//  Created by 游宗諭 on 2020/4/17.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import SwiftUI

struct Label:View {
  init(_ text: String) {
    self.text = text
  }
  
  let text:String
  var body: some View {
    Text(text)
      .frame(minWidth: 100, alignment: .trailing)
  }
}


struct Label_Previews: PreviewProvider {
    static var previews: some View {
      Label("some")
    }
}
