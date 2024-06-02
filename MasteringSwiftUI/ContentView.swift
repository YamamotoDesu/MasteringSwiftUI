//
//  ContentView.swift
//  MasteringSwiftUI
//
//  Created by Yamamoto Kyo on 2024/06/02.
//

import SwiftUI
import DebugFrame

//final class ContentViewModel: ObservableObject {
//
//    @Published var counter: Int = 99
//}


@Observable
final class ContentViewModel {

    var counter: Int = 99 {
        didSet {
            print(counter)
        }
    }

    var values: [Int] = [Int](1...100_000)
}

struct ContentView: View {

    var model: ContentViewModel

    init(_ model: ContentViewModel) {
        self.model = model
        print(Self.self, #function)
    }

    var body: some View {
        let _ = Self._printChanges()
        VStack {
            ContentListView(values: model.values)
            Text("Counter: \(model.counter)")
            Button {
                model.counter += 1
            } label: {
                Text("Counter +1")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .debugBackground()
    }
}

// MARK: - Inside types

private extension ContentView {

    struct ContentListView: View, Equatable {

        let values: [Int]

        init(values: [Int]) {
            self.values = values
            print(Self.self, #function)
        }

        var body: some View {
            let _ = Self._printChanges()
            List {
                ForEach(values, id: \.self) {
                    Text(String($0))
                        .padding()
                        .debugBackground()
                }
            }
            .listStyle(.plain)
            .frame(height: 200.0)
            .padding()
            .debugBackground()
        }
    }
}

@available(iOS 17, *)
#Preview {
    ContentView(ContentViewModel())
}
