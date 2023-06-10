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
}
