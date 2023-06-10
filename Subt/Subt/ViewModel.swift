//
//  ViewModel.swift
//  Subt
//
//  Created by 박현우 on 2023/06/10.
//

import Foundation
import ActivityKit

class ViewModel: ObservableObject {
    @Published public var activity: Activity<SubtWidgetAttributes>?
    @Published public var remain: Int = 10
    
    func createLiveAcitiviy(start: String, end: String) {
        let attributes = SubtWidgetAttributes(name: "test")
        let contentState = SubtWidgetAttributes.ContentState(
            startStation: start,
            endStation: end,
            state: .departure,
            remainStation: self.remain
        )
        do {
          activity = try Activity.request(attributes: attributes, contentState: contentState)
        } catch (let error) {
          print("Error requesting stock trade Live Activity \(error.localizedDescription).")
        }
    }
    
    func updateLiveActivity() async {
        let state = SubtWidgetAttributes.ContentState(
            startStation: "신림",
            endStation: "삼성",
            state: .moving,
            remainStation: 5
        )
        await activity?.update(using: state)
    }
}
