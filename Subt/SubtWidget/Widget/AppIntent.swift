//
//  AppIntent.swift
//  SubtWidget
//
//  Created by Kyeongmo Yang on 2023/06/10.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Subt"
    static var description = IntentDescription("Subt Widget")

    // An example configurable parameter.
    
    @Parameter(title: "출발 역", default: "")
    var startStation: String
    
    @Parameter(title: "도착 역", default: "")
    var endStation: String
    
    @Parameter(title: "진행 상황", default: 0)
    var progress: Double
}

extension ConfigurationAppIntent {
    static var sillimToNak: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.progress = 0.3
        return intent
    }
    
    static var nakToSeocho: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.progress = 0.6
        return intent
    }
    
    static var seochoToGangnam: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.progress = 1
        return intent
    }
}
