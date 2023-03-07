//
//  SplashPresenter.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import Foundation

protocol SplashPresenterDelegate: BaseDelegate {
    func splashPresenter(_ presenter: SplashPresenter, didLoginWithUser user: Account)
    func splashPresenterDidntLoginWithUser(_ presenter: SplashPresenter)
    
}

class SplashPresenter {
    
    // MARK: - Properties
    weak var delegate: SplashPresenterDelegate?
    
    // MARK: - Methods
    func checkIfUserIsLoggedIn() {
        if let user = DataBaseHelper.getUser() {
            delegate?.splashPresenter(self, didLoginWithUser: user)
        } else {
            delegate?.splashPresenterDidntLoginWithUser(self)
        }
        
    }
}
