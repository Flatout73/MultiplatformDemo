//
//  ContentView.swift
//  SwiftUIMultiplatformDemo
//
//  Created by Leonid Lyadveykin on 03.05.2023.
//

import SwiftUI

public struct ContentView: View {
    let arr = (0...20).map { String($0) }

    public init() {
        
    }

    @State
    private var selectedItem: String?

    @FocusState
    private var focusPage: String?

    @ViewBuilder
    var listView: some View {
#if os(watchOS)
        List(arr, id: \.self) { number in
            NavigationLink(destination: DetailedView(str: number)) {
                CellView(text: number)
            }
        }
#else
        List(arr, id: \.self, selection: $selectedItem) {
            CellView(text: $0)
                .focused($focusPage, equals: $0)
                .scaleEffect(focusPage == $0 ? 2 : 1)
        }
#endif

    }

    @ViewBuilder
    var mainView: some View {
        listView
            .navigationTitle("List")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Primary") {

                    }
                }
            }
    }

    public var body: some View {
#if os(watchOS)
        NavigationStack {
            mainView
        }
#else
        NavigationSplitView {
            mainView
        } content: {
            Text("Content")
        } detail: {
            if let selectedItem {
                DetailedView(str: selectedItem)
            } else {
                Text("Empty")
            }
        }
#endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
