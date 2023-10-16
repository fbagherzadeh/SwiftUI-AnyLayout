//
//  beforeiOS16.swift
//  SwiftUI-AnyLayout
//
//  Created by Farhad Bagherzadeh on 26/7/2023.
//

import SwiftUI

struct BeforeiOS16: View {
  @State var isHorizontal = false

  var body: some View {
    VStack {
      if isHorizontal {
        HStack {
          Text("One")
          Text("Two")
          Text("Three")
        }
      } else {
        VStack {
          Text("One")
          Text("Two")
          Text("Three")
        }
      }
      Button("Toggle") {
        withAnimation {
          isHorizontal.toggle()
        }
      }
    }
    .font(.largeTitle)
    .animation(.default, value: isHorizontal)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct beforeiOS16_Previews: PreviewProvider {
  static var previews: some View {
    BeforeiOS16()
  }
}
