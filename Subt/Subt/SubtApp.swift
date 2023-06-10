//
//  SubtApp.swift
//  Subt
//
//  Created by Kyeongmo Yang on 2023/06/10.
//

import SwiftUI
import SwiftData

@main
struct SubtApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
