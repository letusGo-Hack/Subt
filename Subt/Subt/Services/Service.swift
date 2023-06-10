//
//  Service.swift
//  Subt
//
//  Created by Kyeongmo Yang on 2023/06/10.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case responseError(error: ErrorCode)
}

public class Service {
    static let key = "4270594969666f7638366551616e74/"
    
    static let host = "http://swopenapi.seoul.go.kr/"
    static let path = "api/subway/\(Service.key)json/realtimeStationArrival/0/5/"
    
    func fetchArrivalInfo() async throws {
        let urlString: String = Service.host + Service.path + "삼성/"
        guard let url = URL(string: urlString)
        else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let arrivalResponse = try JSONDecoder().decode(Response.self, from: data)
            
            guard arrivalResponse.errorMessage.code.isValid
            else {
                throw NetworkError.responseError(error: arrivalResponse.errorMessage.code)
            }
            
            print(arrivalResponse.realtimeArrivalList.first)
        } catch {
            print(error)
        }
    }
}

