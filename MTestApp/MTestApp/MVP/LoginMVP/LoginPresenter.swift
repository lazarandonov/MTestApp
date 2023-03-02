//
//  LoginPresenter.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import Foundation

protocol LoginPresenterDelegate: BaseDelegate {
    
}

class LoginPresenter {
    
    // MARK: - Private Properties
    private let api: API = API()
    
    // MARK: - Properties
    weak var delegate: LoginPresenterDelegate?
    
    // MARK: - Methods
    func login(_ model: LoginRequestModel) {
        delegate?.showLoader()
        api.login(model)
    }
}
