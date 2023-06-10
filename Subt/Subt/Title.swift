//
//  Title.swift
//  Subt
//
//  Created by Glen on 6/10/23.
//

import SwiftUI

struct Title: View {
    var title: String
    var body: some View {
        Text("\(title)")
            .font(.title2)
            .bold()
    }
}
#Preview {
    Title(title: "Test")
}
