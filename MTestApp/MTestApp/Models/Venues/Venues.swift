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
    var distance: Double
    var distanceInMiles: Double
    var venue: VenueData
    
    enum CodingKeys: String, CodingKey {
        case distance, venue
        case distanceInMiles = "distance_in_miles"
    }
}

struct VenueData: Codable {
    var id: Int
    var name: String
    var code: String
    var description: String
    var address: String
    var isOpen: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, name, code, description, address
        case isOpen = "is_open"
    }
}

struct VenueTimeZone: Codable {
    var name: String
    var offset: String
}
