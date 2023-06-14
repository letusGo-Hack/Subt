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
    
    @State var startText: String = "신림"
    @State var endText: String = "삼성"
    
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
                    StationTextField(text: $startText, isTapped: $startTapped, name: "")
                }
                .padding()
                VStack {
                    Title(title: "END")
                    StationTextField(text: $endText, isTapped: $endTapped, name: "")
                }
                .padding()
            }
            
            Button("Start") {
                viewModel.createLiveAcitiviy(start: startText, end: endText) {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                        if timer.timeInterval == 10 {
                            Task {
                                timer.invalidate()
                                await viewModel.endLiveActivity()
                            }
                        } else {
                            Task {
                                await viewModel.updateLiveActivity()
                            }
                        }
                    }.fire()
                }
            }
            .buttonStyle(MyButtonStyle(buttonColor: .cyan, textColor: .white))
        }
    }
}

#Preview {
    ContentView()
}
