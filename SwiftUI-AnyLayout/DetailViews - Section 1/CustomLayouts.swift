//
//  CustomLayouts.swift
//  SwiftUI-AnyLayout
//
//  Created by Farhad Bagherzadeh on 30/7/2023.
//

import SwiftUI

struct CustomLayouts: View {
  @State var isBackslash = true
  
  var body: some View {
    let layout = isBackslash ? AnyLayout(BackslashStack())
    : AnyLayout(VStackLayout())

    VStack {
      layout {
        Text("One")
        Text("Two")
        Text("Three")
      }
      Button("Toggle") {
        withAnimation {
          isBackslash.toggle()
        }
      }
    }
    .font(.largeTitle)
  }
}

struct CustomLayouts_Previews: PreviewProvider {
  static var previews: some View {
    CustomLayouts()
  }
}

struct BackslashStack: Layout {
  func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
    let subviewSizes = subviews.map { proxy in
      return proxy.sizeThatFits(.unspecified)
    }

    let combinedSize = subviewSizes.reduce(.zero) { currentSize, subviewSize in
      return CGSize(
        width: currentSize.width + subviewSize.width,
        height: currentSize.height + subviewSize.height)
    }

    return combinedSize
  }

  func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
    let subviewSizes = subviews.map { proxy in
      return proxy.sizeThatFits(.unspecified)
    }

    var x = bounds.minX
    var y = bounds.minY

    for index in subviews.indices {
      let subviewSize = subviewSizes[index]
      let sizeProposal = ProposedViewSize(width: subviewSize.width, height: subviewSize.height)

      subviews[index]
        .place(
          at: CGPoint(x: x, y: y),
          anchor: .topLeading,
          proposal: sizeProposal
        )

      x += subviewSize.width
      y += subviewSize.height
    }
  }
}
