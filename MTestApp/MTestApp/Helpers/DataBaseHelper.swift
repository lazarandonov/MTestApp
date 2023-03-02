//
//  DataBaseHelper.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import Foundation

private enum UserDefaultKeys: String {
    case user
    
    static var allCases: [UserDefaultKeys] {
        return [.user]
    }
}

class DataBaseHelper {
    
    static func saveUser(_ user: User) {
        do {
            let userData = try JSONEncoder().encode(user)
            UserDefaults.standard.set(userData, forKey: UserDefaultKeys.user.rawValue)
            UserDefaults.standard.synchronize()
        } catch {
            debugPrint(error)
        }
    }
    
    static func getUser() -> User? {
        do {
            guard let userData = UserDefaults.standard.data(forKey: UserDefaultKeys.user.rawValue) else {
                return nil
            }
            let user = try JSONDecoder().decode(User.self, from: userData)
            return user
        } catch {
            debugPrint(error)
            return nil
        }
    }
}
