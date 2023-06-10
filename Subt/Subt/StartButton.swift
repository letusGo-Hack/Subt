//
//  StartButton.swift
//  Subt
//
//  Created by Glen on 6/10/23.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
    let buttonColor: Color
    let textColor: Color
    let cornerRadius: CGFloat = 10.0
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20).bold())
            .frame(width: 300, height: 25)
            .padding()
            .foregroundColor(textColor)
            .background(buttonColor)
            .cornerRadius(cornerRadius)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}



struct StartButton: View {
    var body: some View {
        Button("Start") {
            // action
        }
        .buttonStyle(MyButtonStyle(buttonColor: .black, textColor: .white))
    }
}

#Preview {
    StartButton()
}
