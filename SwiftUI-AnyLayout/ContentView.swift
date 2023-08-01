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
        navLink(title: "Before iOS 16") { BeforeiOS16() }
        navLink(title: "Default layouts") { DefaultLayouts() }
        navLink(title: "Custom layouts") { CustomLayouts() }
      }
      .navigationTitle("AnyLayout")
    }
  }
}

private extension ContentView {
  func navLink<Content: View>(
    title: String,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination: content) {
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
