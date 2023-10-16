//
//  StateGeometryReaderHStack.swift
//  SwiftUI-AnyLayout
//
//  Created by Farhad Bagherzadeh on 17/10/2023.
//

import SwiftUI

// Issues:
// 1. on device rotate doesn't behave well. Possible solution might be orientationDidChangeNotification
// 2. Double rendering, initial and onAppear

struct StateGeometryReaderHStack: View {
  @State private var size: CGSize = .init()

  var body: some View {
    HStack(spacing: .zero) {
      let component1Width = size.width * 0.75
      let component2Width = size.width * 0.25
      Text("3/4")
        .frame(width: component1Width)
        .background(.red)

      Text("1/4")
        .frame(width: component2Width)
        .background(.blue)
    }
    .frame(maxWidth: .infinity)
    .background(
      GeometryReader { geometry in
        Rectangle()
          .fill(Color.clear)
          .onAppear {
            size = geometry.size
          }
      }
    )
    .background(.gray)
  }
}

struct StateGeometryReaderHStack_Previews: PreviewProvider {
  static var previews: some View {
    StateGeometryReaderHStack()
  }
}
