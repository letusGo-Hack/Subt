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
    
    var body: some View {
        HStack {
            VStack {
                Text("출발 역")
                Text("\(context.state.startStation)")
            }
            
            VStack {
                ProgressView(value: 1)
                Text("🚂")
            }
            
            VStack {
                Text("도착 역")
                Text("\(context.state.endStation)")
            }
        }
        .activityBackgroundTint(Color.green)
        .activitySystemActionForegroundColor(Color.black)
    }
}
