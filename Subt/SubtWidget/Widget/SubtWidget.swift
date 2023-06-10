//
//  SubtWidget.swift
//  SubtWidget
//
//  Created by Kyeongmo Yang on 2023/06/10.
//

import WidgetKit
import SwiftUI

struct SubtWidget: Widget {
    let kind: String = "gutim.Subt.SubtWidget.Widget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind,
                               intent: ConfigurationAppIntent.self,
                               provider: Provider(startStation: "신림", endStation: "삼성", stationToGo: 10)
        ) { entry in
            SubtWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Subt")
        .description("지하철을 추적해보세요")
        .supportedFamilies([.systemMedium])
    }
}
