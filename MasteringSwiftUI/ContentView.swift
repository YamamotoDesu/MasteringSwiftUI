//
//  ContentView.swift
//  MasteringSwiftUI
//
//  Created by Yamamoto Kyo on 2024/06/02.
//

import SwiftUI

struct ContentView: View {

    @State private var counter: Int = 99

    init() {
        print(Self.self, #function)
    }

    var body: some View {
        let _ = Self._printChanges()
        VStack {
//            Text("Counter: \(counter)")
            Button {
                counter += 1
            } label: {
                Text("Counter +1")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .debugBackground()
    }
}

#Preview {
    ContentView()
}
