//
//  Response.swift
//  Subt
//
//  Created by Kyeongmo Yang on 2023/06/10.
//

import Foundation

struct Response: Decodable {
    let realtimeArrivalList: [RealtimeArrivalDTO]
    let errorMessage: ErrorMessage
}
