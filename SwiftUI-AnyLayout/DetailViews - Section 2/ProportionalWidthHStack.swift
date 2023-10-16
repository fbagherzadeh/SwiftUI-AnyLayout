//
//  ProportionalWidthHStack.swift
//  SwiftUI-AnyLayout
//
//  Created by Farhad Bagherzadeh on 17/10/2023.
//

import SwiftUI

// Issues:
// 1. iOS 16+
// 2. Calculation a bit complex

struct ProportionalWidthHStack: View {
  var body: some View {
    CustomHStack(widthWeights: [0.75, 0.25], alignment: .center) {
      Text("3/4")
        .frame(maxWidth: .infinity)
        .background(.red)
      Text("1/4")
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background(.blue)
    }
    .background(.gray)
  }
}

struct CustomHStack: Layout {
  private let widthWeights: [CGFloat]
  private let spacing: CGFloat
  private let alignment: VerticalAlignment

  init(widthWeights: [CGFloat], alignment: VerticalAlignment = .center, spacing: CGFloat? = nil) {
    self.widthWeights = widthWeights
    self.alignment = alignment
    self.spacing = spacing ?? .zero
  }

  func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
    let maxHeight = subviews
      .map { proxy in
        return proxy.sizeThatFits(.unspecified).height
      }
      .max() ?? .zero

    return CGSize(width: proposal.width ?? .zero, height: maxHeight)
  }

  func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
    guard widthWeights.count == subviews.count else { return }

    let subviewSizes = subviews.map { proxy in
      return proxy.sizeThatFits(.infinity)
    }

    var x = bounds.minX
    let parentTotalWith = (proposal.width ?? .zero) - (CGFloat((widthWeights.count - 1)) * spacing)

    for index in widthWeights.indices {
      let widthWeight = widthWeights[index]
      let subviewWidth = widthWeight * parentTotalWith
      let subviewProposedSize = ProposedViewSize(width: subviewWidth, height: subviewSizes[index].height)
      let y = switch alignment {
      case .top: bounds.minY
      case .bottom: bounds.maxY - subviewSizes[index].height
      default: bounds.midY - (subviewSizes[index].height / 2)
      }

      subviews[index]
        .place(
          at: CGPoint(x: x, y: y),
          anchor: .topLeading,
          proposal: subviewProposedSize
        )

      x += (subviewWidth + spacing)
    }
  }
}

struct ProportionalWidthHStack_Previews: PreviewProvider {
  static var previews: some View {
    ProportionalWidthHStack()
  }
}
