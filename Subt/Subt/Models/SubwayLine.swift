//
//  SubwayLine.swift
//  Subt
//
//  Created by Kyeongmo Yang on 2023/06/10.
//

import Foundation
import SwiftUI

enum SubwayLine: String, Decodable {
    case 일호선 = "1001"
    case 이호선 = "1002"
    case 삼호선 = "1003"
    case 사호선 = "1004"
    case 오호선 = "1005"
    case 육호선 = "1006"
    case 칠호선 = "1007"
    case 팔호선 = "1008"
    case 구호선 = "1009"
    case 중앙선 = "1061"
    case 경의중앙선 = "1063"
    case 공항철도 = "1065"
    case 경춘선 = "1067"
    case 수인분당선 = "1075"
    case 신분당선 = "1077"
    case 우이신설선 = "1092"
    
    var subwayColor: Color {
        let color: Color =
        switch self {
        case .일호선:
            Color("Line1")
        case .이호선:
            Color("Line2")
        case .삼호선:
            Color("Line3")
        case .사호선:
            Color("Line4")
        case .오호선:
            Color("Line5")
        case .육호선:
            Color("Line6")
        case .칠호선:
            Color("Line7")
        case .팔호선:
            Color("Line8")
        case .구호선:
            Color("Line9")
        case .중앙선:
            Color("Line1")
        case .경의중앙선:
            Color("LineKyeongYi")
        case .공항철도:
            Color("LineAirport")
        case .경춘선:
            Color("LineKyeongChun")
        case .수인분당선:
            Color("LineBundang")
        case .신분당선:
            Color("LineSinBundang")
        case .우이신설선:
            Color.black
        }
        return color
    }
}

extension Color {
    
}
