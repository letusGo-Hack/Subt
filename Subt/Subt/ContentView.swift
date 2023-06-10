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
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            Button("Start") {
                viewModel.createLiveAcitiviy()
            }
            Text("Select an item")
        }.onAppear(perform: {
            Task {
                await viewModel.updateLiveActivity()
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
