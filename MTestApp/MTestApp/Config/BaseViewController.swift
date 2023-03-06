//
//  BaseViewController.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let activityIndicator = ActivityIndicatorView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

// MARK: - Private Methods
extension BaseViewController {
    private func startLoader() {
        DispatchQueue.main.async {
            self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(self.activityIndicator)
            NSLayoutConstraint.activate([
                self.activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                self.activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                self.activityIndicator.heightAnchor.constraint(equalToConstant: 120),
                self.activityIndicator.widthAnchor.constraint(equalToConstant: 120)
            ])
            self.activityIndicator.startAnimating()
        }
        
    }
    
    private func stopLoader() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.removeFromSuperview()
    }
}

// MARK: - BaseDelegate
extension BaseViewController: BaseDelegate {
    func showLoader() {
        self.startLoader()
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.stopLoader()
        }
    }
    
    func handleAPIError(_ error: ErrorResponse) {
        DispatchQueue.main.async {
            self.stopLoader()
            let alertController = UIAlertController(title: error.data.message, message: error.data.info_message.body, preferredStyle: .alert)
            let okAlertAction = UIAlertAction(title: "OK", style: .cancel)
            
            alertController.addAction(okAlertAction)
            self.present(alertController, animated: true)
        }
    }
}
