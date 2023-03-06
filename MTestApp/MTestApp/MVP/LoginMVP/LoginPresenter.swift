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
        api.login(model,
           didLoginWithUser: { [weak self] (user) in
            guard let self = self else { return }
            self.delegate?.hideLoader()
            
        }, didFinishWithError: { [weak self] (error) in
            self?.delegate?.handleAPIError(error)
        })
    }
}
