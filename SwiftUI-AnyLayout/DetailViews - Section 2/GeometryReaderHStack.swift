//
//  GeometryReaderHStack.swift
//  SwiftUI-AnyLayout
//
//  Created by Farhad Bagherzadeh on 17/10/2023.
//

import SwiftUI

// Issues:
// 1. .frame(height: _) need to be set for GeometryReader
// 2. HStack spacing doesn't work as expected

struct GeometryReaderHStack: View {
  var body: some View {
    GeometryReader { geometry in
      HStack(spacing: .zero) {
        let component1Width = geometry.size.width * 0.75
        let component2Width = geometry.size.width * 0.25
        Text("3/4")
          .frame(width: component1Width)
          .background(.red)

        Text("1/4")
          .frame(width: component2Width)
          .background(.blue)
      }
    }
    .frame(height: 20) // >> you can actually set the height to zero(`.frame(height: .zero)`) instead and GeometryReader respect its content size!
    .background(.gray)
  }
}

struct GeometryReaderHStack_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReaderHStack()
  }
}
