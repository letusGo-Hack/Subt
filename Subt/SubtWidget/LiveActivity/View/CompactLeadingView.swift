//
//  CompactLeadingView.swift
//  Subt
//
//  Created by 박현우 on 2023/06/10.
//

import SwiftUI
import WidgetKit

struct CompactLeadingView: View {
    
    let context : ActivityViewContext<SubtWidgetAttributes>
    
    var body: some View {
        Text(context.state.startStation)
            .fontWeight(.bold)
    }
}
