//
//  PreferenceKeyStateGeoReaderHStack.swift
//  SwiftUI-AnyLayout
//
//  Created by Farhad Bagherzadeh on 17/10/2023.
//

import SwiftUI

// Issues:
// 1. on device rotate doesn't work quite well
// 2. Double rendering, initial and onAppear
// 3. HStack spacing doesn't work as expected

struct PreferenceKeyStateGeoReaderHStack: View {
  @State var size: CGSize = .zero

  var body: some View {
    HStack(spacing: .zero) {
      Text("3/4")
        .frame(width: size.width * 0.75)
        .background(.red)
      Text("1/4")
        .frame(width: size.width * 0.25)
        .background(.blue)
    }
    .frame(maxWidth: .infinity)
    .background(GeometryReader { geometry in
      Color.clear
        .preference(key: SizePreferenceKey.self, value: geometry.size)
    })
    .onPreferenceChange(SizePreferenceKey.self) { size in
      self.size = size
    }
    .background(.gray)
  }
}

struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
    value = nextValue()
  }
}

struct PreferenceKeyStateGeoReaderHStack_Previews: PreviewProvider {
  static var previews: some View {
    PreferenceKeyStateGeoReaderHStack()
  }
}
