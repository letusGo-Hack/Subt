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
                LinearProgressView(progress: progress)
                Text(context.state.endStation)
            }
            Text("\(context.state.remain)정거장 남았습니다.")
        }
        .padding()
        .activityBackgroundTint(Color("LineAirport"))
        .activitySystemActionForegroundColor(Color.black)
    }
}
