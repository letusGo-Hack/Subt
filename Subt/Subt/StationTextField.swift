//
//  StationTextField.swift
//  Subt
//
//  Created by Glen on 6/10/23.
//

import SwiftUI

struct StationTextField: View {
    @Binding var text: String
    @Binding var isTapped: Bool
    var name: String = ""
    //    @Binding var isTapped: Bool
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4, content: {
                HStack(spacing: 15) {
                    TextField("", text: $text) { (state) in
                        if state {
                            withAnimation(.easeIn) {
                                isTapped = true
                            }
                        }
                    } onCommit: {
                        if text == "" {
                            withAnimation(.easeOut) {
                                isTapped = false
                            }
                        }
                    }
                    Button(action: {}, label: {
                        Image(systemName: "pencil")
                            .foregroundStyle(.gray)
                    })
                }
                .padding(.top, isTapped ? 15 : 0)
                .background(
                    Text("\(name)")
                    .scaleEffect(isTapped ? 0.8 : 1)
                    .offset(x: isTapped ? -7 : 0, y: isTapped ? -15 : 0)
                    .foregroundColor(isTapped ? .green : .red)
                ,alignment:  .leading
                )
            })
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color.gray.opacity(0.09))
            .cornerRadius(14)
            }
    }
}

#Preview {
    @State var text: String = ""
    @State var isTapped: Bool = false
    
    return StationTextField(text: $text, isTapped: $isTapped, name: "도착역")
//    ContentView()
}

