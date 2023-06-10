//
//  LinearProgressView.swift
//  Subt
//
//  Created by 박현우 on 2023/06/10.
//

import SwiftUI

public struct LinearProgressView : View {
    var progress : Double
    
    public var body: some View {
        VStack(alignment: .center) {
            Spacer(minLength: 25)
            GeometryReader { geometry in
                Image(systemName: "train.side.front.car")
                    .foregroundStyle(.white)
                    .offset(x: geometry.size.width * CGFloat(progress) - 26 , y: -20)
                
                ProgressView(value: progress, total: 1)
                    .tint(.white)
            }
        }
    }
}
