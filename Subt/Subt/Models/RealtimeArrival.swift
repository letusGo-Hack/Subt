//
//  RealtimeArrival.swift
//  Subt
//
//  Created by Kyeongmo Yang on 2023/06/10.
//

import Foundation

struct RealtimeArrivalDTO: Decodable {
    let arrivalCode: ArrivalCode
    let arrivalMessage2, arrivalMessage3: String?
    let barvlDt: String?
    let beginRow: String?
    let bstatnID: String?
    let bstatnNm: String?
    let btrainNo: String?
    let trainKind: TrainKind
    let curPage, endRow, ordkey: String?
    let pageRow, recptnDt: String?
    let rowNum, selectedCount, totalCount: Int
    let statnFid, statnID: String?
    let statnList: String?
    let statnNm: String?
    let statnTid: String?
    let subwayHeading: String?
    let subwayList: String?
    let subwayLine: SubwayLine
    let subwayNm: String?
    let trainCo, trainLineNm: String?
    let trnsitCo: String?
    let updnLine: UpAndDownLine
    
    enum CodingKeys: String, CodingKey {
        case arrivalCode = "arvlCd"
        case arrivalMessage2, arrivalMessage3, barvlDt, beginRow
        case bstatnID = "bstatnId"
        case trainKind = "btrainSttus"
        case bstatnNm, btrainNo, curPage, endRow, ordkey, pageRow, recptnDt, rowNum, selectedCount, statnFid
        case statnID = "statnId"
        case statnList, statnNm, statnTid, subwayHeading
        case subwayLine = "subwayId"
        case subwayList, subwayNm, totalCount, trainCo, trainLineNm, trnsitCo, updnLine
    }
}

enum UpAndDownLine: String, Decodable {
    case 상행내선 = "0"
    case 하행외선 = "1"
}

enum TrainKind: String, Decodable {
    case 급행
    case ITX
    case 일반
}

enum ArrivalCode: String, Decodable {
    case 진입 = "0"
    case 도착 = "1"
    case 출발 = "2"
    case 전역출발 = "3"
    case 전역진입 = "4"
    case 전역도착 = "5"
    case 운행중 = "99"
}
