//
//  ErrorMessage.swift
//  Subt
//
//  Created by Kyeongmo Yang on 2023/06/10.
//

import Foundation

struct ErrorMessage: Decodable {
    let code, developerMessage, link, message: String
    let status, total: Int
}
