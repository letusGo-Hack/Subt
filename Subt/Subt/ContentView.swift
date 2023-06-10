//
//  ContentView.swift
//  Subt
//
//  Created by Kyeongmo Yang on 2023/06/10.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
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
            
            Spacer()
                .frame(height: 200)
            
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
                viewModel.createLiveAcitiviy(start: startText, end: endText)
            }
            .buttonStyle(MyButtonStyle(buttonColor: .cyan, textColor: .white))
        }.onAppear(perform: {
            Task {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    Task {
                        await viewModel.updateLiveActivity()
                    }
                }
            }
        })
    }
}

#Preview {
    ContentView()
}
