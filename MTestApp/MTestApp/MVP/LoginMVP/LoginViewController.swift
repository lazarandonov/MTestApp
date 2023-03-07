//
//  LoginViewController.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import UIKit

class LoginViewController: BaseViewController {
    
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
        setupTargets()
    }
    
    private func setupDelegates() {
        presenter?.delegate = self
    }
    
    private func setupTargets() {
        loginView.signInButton.addTarget(self, action: #selector(signInButtonHandler), for: .touchUpInside)
    }
}

// MARK: - Private Targets
extension LoginViewController {
    @objc private func signInButtonHandler() {
        let email = loginView.emailTextField.text ?? ""
        let password = loginView.passwordTextField.text ?? ""
        let model = LoginRequestModel(email: email, password: password)
        presenter?.login(model)
    }
}

// MARK: - LoginPresenterDelegate
extension LoginViewController: LoginPresenterDelegate {
    func loginPresenter(_ presenter: LoginPresenter, didLoginWithUser user: CustomerAccount, andToken token: Token) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Venue", bundle: nil)
            guard let venueListViewController = storyboard
                .instantiateViewController(withIdentifier: "VenueListViewController") as? VenueListViewController,
                  let appDelegate = UIApplication.shared.delegate as? AppDelegate,
                  let window = appDelegate.window else { return }
            
            venueListViewController.presenter = VenueListPresenter(token: token.value)
            window.rootViewController = venueListViewController
            window.makeKeyAndVisible()
        }
    }
}
