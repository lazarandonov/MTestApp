//
//  AppDelegate.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupInitialScreen()
        
        return true
    }
}

// MARK: - Private Methods
extension AppDelegate {
    private func setupInitialScreen() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        let sotryboard = UIStoryboard(name: "Splash", bundle: nil)
        guard let splashViewController = sotryboard.instantiateViewController(withIdentifier: "SplashViewController") as? SplashViewController else {
            return
        }
        splashViewController.presenter = SplashPresenter()
        window?.rootViewController = splashViewController
        window?.makeKeyAndVisible()
    }
}

