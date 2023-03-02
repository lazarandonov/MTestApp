//
//  SplashViewController.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import UIKit

class SplashViewController: UIViewController {
    
    // MARK: - Properties
    var splashView: SplashView {
        loadViewIfNeeded()
        return view as! SplashView
    }
    
    var presenter: SplashPresenter?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

// MARK: - Private Methods
extension SplashViewController {
    private func setup() {
        splashView.setup()
        setupDelegates()
        checkIfUserIsLoggedIn()
    }
    
    private func setupDelegates() {
        presenter?.delegate = self
    }
    
    private func checkIfUserIsLoggedIn() {
        presenter?.checkIfUserIsLoggedIn()
    }
}

// MARK: - SplashPresenterDelegate
extension SplashViewController: SplashPresenterDelegate {
    func splashPresenter(_ presenter: SplashPresenter, didLoginWithUser user: String) {
        
    }
    
    func splashPresenterDidntLoginWithUser(_ presenter: SplashPresenter) {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        guard let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController,
              let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appDelegate.window
            else { return }
        
        window.rootViewController = loginViewController
        window.makeKeyAndVisible()
    }
}
