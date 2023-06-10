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
    @State var animation: Bool = false
    
    @State var startText: String = ""
    @State var endText: String = ""
    
    @State var startTapped: Bool = false
    @State var endTapped: Bool = false
    
    var body: some View {
        VStack {

            Text("Subway Tracker Widget")
                .font(.title)
            // Widget

            RoundedRectangle(cornerRadius: 15)
                .frame(maxWidth: .infinity, maxHeight: 130, alignment: .center)
                .padding()
            
            Title(title: "Animation")
            OptionButton(animation: animation)
                
            HStack {
                VStack {
                    Title(title: "START")
                    StationTextField(text: $startText, isTapped: $startTapped, name: "출발역")
                }
                .padding()
                VStack {
                    Title(title: "END")
                    StationTextField(text: $endText, isTapped: $endTapped, name: "도착역")
                }
                .padding()
            }
            
            Button("Start") {
                viewModel.createLiveAcitiviy()
            }
            .buttonStyle(MyButtonStyle(buttonColor: .cyan, textColor: .white))
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
