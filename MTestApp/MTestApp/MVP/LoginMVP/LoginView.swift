//
//  LoginView.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import UIKit

class LoginView: UIView {
    
    // MARK: - UIImageView Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - CustomLabel Outlets
    @IBOutlet weak var titleLabel: CustomLabel!
    @IBOutlet weak var subtitleLabel: CustomLabel!
    
    // MARK: - UITextField Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - UIButton Outlet
    @IBOutlet weak var signInButton: UIButton!
    
    // MARK: - Setup Method
    func setup() {
        setupImageView()
        setupCustomLabels()
        setupTextFields()
        setupButtons()
    }
}

// MARK: - Private methods
extension LoginView {
    private func setupImageView() {
        imageView.image = UIImage(named: "onboarding")
    }
    
    private func setupCustomLabels() {
        titleLabel.setFontSize(to: 28, type: .bold, color: .black)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.text = "The easiest way to order"
        
        subtitleLabel.setFontSize(to: 17, type: .regular, color: UIColor.black.withAlphaComponent(0.8))
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = "No lines. No waiting."
    }
    
    private func setupTextFields() {
        emailTextField.textAlignment = .left
        emailTextField.textColor = .black
        emailTextField.borderStyle = .none
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
        passwordTextField.textAlignment = .left
        passwordTextField.textColor = .black
        passwordTextField.borderStyle = .none
        passwordTextField.isSecureTextEntry = true
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
    }
    
    private func setupButtons() {
        signInButton.backgroundColor = UIColor(named: "SiginButtonBackgroundColor")
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        signInButton.layer.cornerRadius = 8
    }
    
}
