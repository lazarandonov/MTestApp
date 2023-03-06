//
//  BaseViewController.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import UIKit
import Network

class BaseViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let activityIndicator = ActivityIndicatorView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNetworkListener()
    }

}

// MARK: - Private Methods
extension BaseViewController {
    private func setupNetworkListener() {
        let monitor = NWPathMonitor()
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                debugPrint("Internet connection is active")
            } else {
                debugPrint("No internet")
            }
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
    
    private func showNoInternetDialog() {
        let alert = UIAlertController(title: "Alert",
            message: "No Internet connection",
            preferredStyle: .alert)

        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) in
            guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
            guard UIApplication.shared.canOpenURL(settingsURL) else { return }
            UIApplication.shared.open(settingsURL)
        }
        alert.addAction(settingsAction)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }
    
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
