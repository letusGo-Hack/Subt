//
//  ErrorMessage.swift
//  Subt
//
//  Created by Kyeongmo Yang on 2023/06/10.
//

import Foundation

struct ErrorMessage: Decodable {
    let code: ErrorCode
    let developerMessage, link, message: String
    let status, total: Int
}

//ERROR-336    데이터요청은 한번에 최대 1000건을 넘을 수 없습니다.
//요청종료위치에서 요청시작위치를 뺀 값이 1000을 넘지 않도록 수정하세요.
//ERROR-500    서버 오류입니다.
//지속적으로 발생시 열린 데이터 광장으로 문의(Q&A) 바랍니다.
//ERROR-600    데이터베이스 연결 오류입니다.
//지속적으로 발생시 열린 데이터 광장으로 문의(Q&A) 바랍니다.
//ERROR-601    SQL 문장 오류 입니다.
//지속적으로 발생시 열린 데이터 광장으로 문의(Q&A) 바랍니다.
//INFO-200    해당하는 데이터가 없습니다.
enum ErrorCode: String, Decodable {
    case 정상처리 = "INFO-000"
    case 필수값누락 = "ERROR-300" // 요청인자를 참고 하십시오.
    case 인증키에러 = "INFO-100" // 인증키가 없는 경우, 열린 데이터 광장 홈페이지에서 인증키를 신청하십시오.
    case 타입에러 = "ERROR-301" // 요청인자 중 TYPE을 확인하십시오.
    case 서비스에러 = "ERROR-310" // 요청인자 중 SERVICE를 확인하십시오.
    case 시작위치스에러 = "ERROR-331" // 요청인자 중 START_INDEX를 확인하십시오.
    case 종료위치에러 = "ERROR-332" // 요청인자 중 END_INDEX를 확인하십시오.
    case 위치에러 = "ERROR-333" // 요청위치 값은 정수를 입력하세요.
    case 조회건수에러 = "ERROR-334" // 요청시작조회건수는 정수를 입력하세요.
    case 조회범위에러 = "ERROR-335" // 요청시작위치와 요청종료위치 값은 1 ~ 5 사이만 가능합니다.
    case 조회량에러 = "ERROR-336" // 요청종료위치에서 요청시작위치를 뺀 값이 1000을 넘지 않도록 수정하세요.
    case 서버에러 = "ERROR-500"
    case 데이터베이스에러 = "ERROR-600"
    case 데이터없음 = "INFO-200"
    
    var isValid: Bool {
        switch self {
        case .정상처리, .데이터없음:
            return true
        default:
            return false
        }
    }
}
