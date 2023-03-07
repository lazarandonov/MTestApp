//
//  ErrorResponse.swift
//  MtestApp
//
//  Created by Lazar Andonov on 6.3.23..
//

import Foundation

struct ErrorResponse: Codable, DefaultServerResponse {
    var status: String
    var code: Int
    var data: ErrorResponseData
    
}

struct ErrorResponseData: Codable {
    var info_message: ErrorResponseDataInfoMessage
    var message: String
    var error_id: String
}

struct ErrorResponseDataInfoMessage: Codable {
    var title: String
    var body: String
}
