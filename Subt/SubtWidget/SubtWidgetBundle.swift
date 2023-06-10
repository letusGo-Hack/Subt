//
//  SubtWidgetBundle.swift
//  SubtWidget
//
//  Created by Kyeongmo Yang on 2023/06/10.
//

import WidgetKit
import SwiftUI

@main
struct SubtWidgetBundle: WidgetBundle {
    var body: some Widget {
        SubtWidget()
        SubtWidgetLiveActivity()
    }
}
