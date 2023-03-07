//
//  DefaultServerResponse.swift
//  MtestApp
//
//  Created by Lazar Andonov on 7.3.23..
//

import Foundation

protocol DefaultServerResponse {
    var status: String { get set }
    var code: Int { get set }
}
