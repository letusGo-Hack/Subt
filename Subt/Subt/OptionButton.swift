//
//  OptionButton.swift
//  Subt
//
//  Created by Glen on 6/10/23.
//

import SwiftUI

struct OptionButtonStyle: ToggleStyle {
    private let width = 120.0
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
          configuration.label
          ZStack(alignment: configuration.isOn ? .trailing : .leading) {
            RoundedRectangle(cornerRadius: 15)
                  .frame(width: width, height: width / 2.5)
              .foregroundColor(configuration.isOn ? .green : .gray)
            
            RoundedRectangle(cornerRadius: 13)
              .frame(width: (width / 2) - 4, height: width / 2 - 18)
              .padding(4)
              .foregroundColor(.white)
              .onTapGesture {
                withAnimation {
                  configuration.$isOn.wrappedValue.toggle()
                }
              }
          }
        }
      }
}


struct OptionButton: View {
    @State var animation: Bool = false
    var body: some View {
        Toggle("", isOn: self.$animation)
            .toggleStyle(OptionButtonStyle())
    }
}

#Preview {
    OptionButton()
}
