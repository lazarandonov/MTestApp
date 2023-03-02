//
//  SplashPresenter.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import Foundation

protocol SplashPresenterDelegate: AnyObject {
    func splashPresenter(_ presenter: SplashPresenter, didLoginWithUser user: String)
    func splashPresenterDidntLoginWithUser(_ presenter: SplashPresenter)
    
}

class SplashPresenter {
    
    // MARK: - Properties
    weak var delegate: SplashPresenterDelegate?
    
    // MARK: - Methods
    func checkIfUserIsLoggedIn() {
        
    }
}
