//
//  ContentView.swift
//  iIcon
//
//  Created by 游宗諭 on 2020/4/16.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import SwiftUI
let platformList = ["iOS","macOS","watchOS"]
let colorList:[Color] = [
  .black,
  .white,
  .gray,
  .red,
  .green,
  .blue,
  .orange,
  .yellow,
  .pink,
  .purple,
  .primary,
  .secondary,
]

struct ContentView: View {
  @State var text:String = "you title"
  @State var fileName = ""
  @State var picked = platformList.first!
  @State var bgcolor: Color = colorList.first!
  @State var fgcolor: Color = colorList[1]
  var body: some View {
    HStack(spacing: 10) {
      Icon($text, fg: $fgcolor, bg: $bgcolor)
      VStack {
        Row("text"){
          TextField("", text: $text)
        }
        
        Row("File Name") {
          TextField("optional", text: $fileName)
        }
        Row("Platform") {
          Picker(selection: $picked, label: Text("")) {
            ForEach(platformList, id: \.self) {
              Text("\($0)")
            }
          }.labelsHidden()
        }
        Row("BColor") {
          
          Picker(selection: $bgcolor, label: Text("")) {
            ForEach(colorList, id: \.self) { color in
              return Text(color.description)
            }
          }.labelsHidden()
          
        }
        Row("FColor") {
          Picker(selection: $fgcolor, label: Text("")) {
            ForEach(colorList, id: \.self) { color in
              return Text(color.description)
            }
          }.labelsHidden()
        }
      }
    }
    .padding()
    .frame(maxWidth: 400, maxHeight: 400)
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

