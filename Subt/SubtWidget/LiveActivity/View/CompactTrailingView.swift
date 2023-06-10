//
//  CompactTrailingView.swift
//  Subt
//
//  Created by 박현우 on 2023/06/10.
//

import SwiftUI
import WidgetKit

struct CompactTrailingView: View {
    
    let context : ActivityViewContext<SubtWidgetAttributes>
    
    var body: some View {
        Text(context.state.endStation)
            .fontWeight(.bold)
    }
}
