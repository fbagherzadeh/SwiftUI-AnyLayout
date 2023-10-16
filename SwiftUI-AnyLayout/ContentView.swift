//
//  ContentView.swift
//  SwiftUI-AnyLayout
//
//  Created by Farhad Bagherzadeh on 26/7/2023.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      List {
        Section {
          navLink(title: "Before iOS 16") { BeforeiOS16() }
          navLink(title: "Default layouts") { DefaultLayouts() }
          navLink(title: "Custom layouts - BackslashStack") { CustomLayouts() }
        } header: {
          Text("Conditional Layout")
        }

        Section {
          navLink(title: "With GeometryReader") { GeometryReaderHStack() }
          navLink(title: "With @State & GeometryReader") { StateGeometryReaderHStack() }
          navLink(title: "With RefKey & @State & GeometryReader") { PreferenceKeyStateGeoReaderHStack() }
          navLink(title: "Custom layouts - ProportionalWidthHStack") { ProportionalWidthHStack() }
        } header: {
          Text("Proportional Width Layout")
        }
      }
      .navigationTitle("Layout & AnyLayout")
    }
  }
}

private extension ContentView {
  func navLink<Content: View>(
    title: String,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(
      destination: content()
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    ) {
      Text(title)
        .font(.headline)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
