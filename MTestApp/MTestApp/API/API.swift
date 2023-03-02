//
//  BaseAPI.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import Foundation
import UIKit

class API {
    
    private enum Endpoint {
        static let login = "customers/login"
        static let listOfVenues = ""
    }
    
    func login(_ model: LoginRequestModel) {
        guard let url = URL(string: Constans.baseURL + Endpoint.login) else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "application" : "mobile-application",
            "Content-Type" : "application/json",
            "Device-UUID" : UIDevice.current.identifierForVendor?.uuidString ?? "123456",
            "Api-Version" : "3.7.0",
        ]
        request.httpMethod = "POST"
        
        do {
            let requestBody = try JSONEncoder().encode(model)
            request.httpBody = requestBody
            
            let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                guard let data = data else { return }
                print(String(data: data, encoding: .utf8)!)
            }

            task.resume()
            
        } catch {
            
        }
       
    }
    
}
