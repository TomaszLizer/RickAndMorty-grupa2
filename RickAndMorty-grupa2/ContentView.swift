//
//  ContentView.swift
//  RickAndMorty-grupa2
//
//  Created by Tomasz Lizer on 25/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .padding(.bottom, 30.0)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .foregroundStyle(.red)
        }
        .background(Color.yellow)
        .padding()
        .background(Color.green)
    }
}

#Preview(
    traits: .sizeThatFitsLayout
) {
    ContentView()
}
