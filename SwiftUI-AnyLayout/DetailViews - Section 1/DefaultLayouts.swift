//
//  DefaultLayouts.swift
//  SwiftUI-AnyLayout
//
//  Created by Farhad Bagherzadeh on 30/7/2023.
//

import SwiftUI

struct DefaultLayouts: View {
  @State var isHorizontal = false

  var body: some View {
    let layout = isHorizontal ? AnyLayout(HStackLayout())
    : AnyLayout(VStackLayout())

    VStack {
      layout {
        Text("One")
        Text("Two")
        Text("Three")
      }
      Button("Toggle") {
        withAnimation {
          isHorizontal.toggle()
        }
      }
    }
    .font(.largeTitle)
  }
}

struct DefaultLayouts_Previews: PreviewProvider {
  static var previews: some View {
    DefaultLayouts()
  }
}
