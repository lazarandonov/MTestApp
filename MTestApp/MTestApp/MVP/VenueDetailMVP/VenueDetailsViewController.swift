//
//  VenueDetailsViewController.swift
//  MtestApp
//
//  Created by Lazar Andonov on 7.3.23..
//

import UIKit

class VenueDetailsViewController: BaseViewController {
    
    // MARK: - Properties
    var venueDetailsView: VenueDetailsView {
        loadViewIfNeeded()
        return view as! VenueDetailsView
    }
    
    var presenter: VenueDetailsPresenter?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

// MARK: - Private Methods
extension VenueDetailsViewController {
    private func setup() {
        title = "Venue Details"
        venueDetailsView.setupWithVenue(presenter?.venue)
        setupDelegates()
        setupTargets()
    }
    
    private func setupDelegates() {
        presenter?.delegate = self
    }
    
    private func setupTargets() {
        venueDetailsView.logoutButton.addTarget(self, action: #selector(logoutButtonHandler), for: .touchUpInside)
    }
}

// MARK: - Private Targets
extension VenueDetailsViewController {
    @objc private func logoutButtonHandler() {
        showLogoutAlert()
    }
    
    private func showLogoutAlert() {
        let alertController = UIAlertController(
            title: "Warning!",
            message: "Are you sure that you want to logout?",
            preferredStyle: .alert)
        
        let noAlertAction = UIAlertAction(title: "No", style: .cancel)
        let yesAlertAction = UIAlertAction(title: "Yes", style: .default, handler: { _ in
            self.presenter?.logout()
        })
        
        alertController.addAction(noAlertAction)
        alertController.addAction(yesAlertAction)
        
        self.present(alertController, animated: true)
    }
}

// MARK: - VenueDetailsPresenterDelegate
extension VenueDetailsViewController: VenueDetailsPresenterDelegate {
    func venueDetailsPresenterDidLogout() {
        
        let storyboard = UIStoryboard(name: "Splash", bundle: nil)
        guard let splashViewController = storyboard
            .instantiateViewController(withIdentifier: "SplashViewController") as? SplashViewController,
              let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appDelegate.window else { return }
        
        splashViewController.presenter = SplashPresenter()
        window.rootViewController = splashViewController
        window.makeKeyAndVisible()
    }
}
