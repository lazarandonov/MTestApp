//
//  User.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import Foundation

struct User: Codable, DefaultServerResponse {
    var status: String
    var code: Int
    var data: Account
}

struct Account: Codable {
    var customerAccount: CustomerAccount
    var token: Token
    
    enum CodingKeys: String, CodingKey {
        case customerAccount = "customer_account"
        case token
    }
}

struct CustomerAccount: Codable {
    var id: Int
    var typeID: Int
    var referenceType: String
    var customerID: Int
    var brandID: Int
    var firstName: String
    var lastName: String
    var email: String
    var confirmed: Bool
    var phoneNumber: String
    var locale: String
    var state: Int
    
    enum CodingKeys: String, CodingKey {
        case id, email, confirmed, locale, state
        case typeID = "type_id"
        case referenceType = "reference_type"
        case customerID = "customer_id"
        case brandID = "brand_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case phoneNumber = "phone_number"
    }
}

struct Token: Codable {
    var value: String
    var ttl: Int
    var refreshTtl: Int
    
    enum CodingKeys: String, CodingKey {
        case value, ttl
        case refreshTtl = "refresh_ttl"
    }
}
