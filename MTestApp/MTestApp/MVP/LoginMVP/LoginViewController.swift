//
//  LoginViewController.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    var loginView: LoginView {
        loadViewIfNeeded()
        return view as! LoginView
    }
    
    var presenter: LoginPresenter?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

}

// MARK: - Private Methods
extension LoginViewController {
    private func setup() {
        loginView.setup()
        setupDelegates()
    }
    
    private func setupDelegates() {
        
    }
}
