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
      Text(text)
        .frame(width: 100,height: 100)
        .foregroundColor(fgcolor)
        .background(bgcolor)
      
      VStack(alignment:.trailing, spacing: 10){
        Text("text")
        Text("File Name")
        Text("Platform")
        Text("BColor")
        Text("FColor")
      }.padding()
      VStack(spacing: 10) {
        TextField("", text: $text)
        TextField("optional", text: $fileName)
        Picker(selection: $picked, label: Text("")) {
          ForEach(platformList, id: \.self) {
            Text("\($0)")
          }
        }.labelsHidden()
        Picker(selection: $bgcolor, label: Text("")) {
          ForEach(colorList, id: \.self) { color in
            return Text(color.description)
          }
        }.labelsHidden()
        Picker(selection: $fgcolor, label: Text("")) {
          ForEach(colorList, id: \.self) { color in
            return Text(color.description)
          }
        }.labelsHidden()
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
