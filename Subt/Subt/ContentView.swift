//
//  ContentView.swift
//  Subt
//
//  Created by Kyeongmo Yang on 2023/06/10.
//

import SwiftUI
import SwiftData
import ActivityKit

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        NavigationView {
            Button("Start") {
                let dynamicIslandWidgetAttributes = SubtWidgetAttributes(name: "test")
                let contentState = SubtWidgetAttributes.ContentState(startStation: "신림", endStation: "삼성", emoji: "🐳")
                
                do {
                    let activity = try Activity<SubtWidgetAttributes>.request(
                        attributes: dynamicIslandWidgetAttributes,
                        contentState: contentState
                    )
                    print(activity)
                    
                } catch {
                    print(error)
                }
            }
            Text("Select an item")
        }.onAppear(perform: {
            Task {
                try await Service().fetchArrivalInfo()
            }
        })
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
