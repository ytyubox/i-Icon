//
//  ContentView.swift
//  iIcon
//
//  Created by 游宗諭 on 2020/4/16.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import SwiftUI
let platformList = ["iOS","macOS","watchOS"]

struct ContentView: View {
  @State var text:String = ""
  @State var fileName = ""
  @State var picked = platformList.first!
  var body: some View {
    HStack(spacing: 10) {
      VStack(alignment:.trailing, spacing: 10){
        Text("text")
        Text("File Name")
        Text("Platform")
      }.padding()
      VStack(spacing: 10) {
        TextField("", text: $text)
        TextField("optional", text: $fileName)
        Picker(selection: $picked, label: Text("")) {
          ForEach(platformList, id: \.self) {
            Text("\($0)")
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
