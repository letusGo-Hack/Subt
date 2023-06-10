//
//  LockScreenView.swift
//  Subt
//
//  Created by 박현우 on 2023/06/10.
//

import SwiftUI
import WidgetKit

struct LockScreenView: View {
    
    let context : ActivityViewContext<SubtWidgetAttributes>
    var progress : Double
    
    var body: some View {
        VStack {
            HStack(spacing : 30) {
                Text(context.state.startStation)
                RoundedRectangle(cornerRadius: 1)
                    .fill(.white)
                    .frame(height: 2)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .overlay(alignment: .trailing) {
                        Image(systemName: "arrow.forward")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.white)
                    }
                Text(context.state.endStation)
            }
            Text("\(context.state.endStation)방향으로 이동중입니다.")
        }
        .padding()
        .activityBackgroundTint(Color("LineAirport"))
        .activitySystemActionForegroundColor(Color.black)
    }
}
