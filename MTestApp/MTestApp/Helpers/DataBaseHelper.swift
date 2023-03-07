//
//  DataBaseHelper.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import Foundation
import QuartzCore

private enum UserDefaultKeys: String {
    case user
}

class DataBaseHelper {
    
    static func saveUser(_ user: Account) {
        do {
            let userData = try JSONEncoder().encode(user)
            UserDefaults.standard.set(userData, forKey: UserDefaultKeys.user.rawValue)
            UserDefaults.standard.synchronize()
        } catch {
            debugPrint(error)
        }
    }
    
    static func getUser() -> Account? {
        do {
            guard let userData = UserDefaults.standard.data(forKey: UserDefaultKeys.user.rawValue) else {
                return nil
            }
            let user = try JSONDecoder().decode(Account.self, from: userData)
            return user
        } catch {
            debugPrint(error)
            return nil
        }
    }
    
    static func removeUser() {
        UserDefaults.standard.removeObject(forKey: UserDefaultKeys.user.rawValue)
        UserDefaults.standard.synchronize()
    }
}
