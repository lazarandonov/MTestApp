//
//  SplashView.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import UIKit

class SplashView: UIView {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Setup Method
    func setup() {
        imageView.image = UIImage(named: "onboarding")
    }
}
