//
//  Venues.swift
//  MtestApp
//
//  Created by Lazar Andonov on 7.3.23..
//

import Foundation

struct VenuesResponseModel: Codable, DefaultServerResponse {
    var status: String
    var code: Int
    var data: Venues
}

struct Venues: Codable {
    var venues: [Venue]
}

struct Venue: Codable {
    
}
