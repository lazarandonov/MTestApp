//
//  ActivityIndicatorView.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import UIKit

class ActivityIndicatorView: UIView {

    // MARK: - UI Properties
    private var indicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.color = .white
        return indicatorView
    }()

    // MARK: - Init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    // MARK: - Method
    func startAnimating() {
        DispatchQueue.main.async {
            self.indicatorView.startAnimating()
        }
        
    }
    
    func stopAnimating() {
        DispatchQueue.main.async {
            self.indicatorView.stopAnimating()
        }
        
    }
}

// MARK: - Private Methods
extension ActivityIndicatorView {
    private func setup() {
        setupConstrains()
        setupStyles()
    }
    
    private func setupConstrains() {
        addSubview(indicatorView)
        
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicatorView.heightAnchor.constraint(equalToConstant: 100),
            indicatorView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupStyles() {
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        layer.cornerRadius = 8
    }
}
