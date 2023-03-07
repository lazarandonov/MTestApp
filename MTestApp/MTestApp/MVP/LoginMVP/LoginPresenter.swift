//
//  LoginPresenter.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import Foundation

protocol LoginPresenterDelegate: BaseDelegate {
    func loginPresenter(_ presenter: LoginPresenter, didLoginWithUser user: CustomerAccount, andToken token: Token)
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
            self.delegate?.loginPresenter(self, didLoginWithUser: user.data.customerAccount, andToken: user.data.token)
        }, didFinishWithError: { [weak self] (error) in
            self?.delegate?.handleAPIError(error)
        })
    }
}
