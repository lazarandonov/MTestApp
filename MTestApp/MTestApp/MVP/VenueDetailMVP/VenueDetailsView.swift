//
//  VenueDetailsView.swift
//  MtestApp
//
//  Created by Lazar Andonov on 7.3.23..
//

import UIKit

class VenueDetailsView: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var venueImageView: UIImageView!
    @IBOutlet weak var venueNameLabel: CustomLabel!
    @IBOutlet weak var venueDescriptionLabel: CustomLabel!
    @IBOutlet weak var venueStatusLabel: CustomLabel!

    // MARK: - Setup Methods
    func setupWithVenue(_ venue: Venue?) {
        setupImageViewWithVenue(venue)
        setupLabelsWithVenue(venue)
        setupButtons()
    }
}

// MARK: - Private Methods
extension VenueDetailsView {
    private func setupImageViewWithVenue(_ venue: Venue?) {
        if let imageUrlString = venue?.venue.image.thumbnailMedium,
            let imageUrl = URL(string: imageUrlString) {
            venueImageView.downloadImage(from: imageUrl)
        }
    }
    
    private func setupLabelsWithVenue(_ venue: Venue?) {
        venueNameLabel.setFontSize(to: 17, type: .bold, color: .black)
        venueNameLabel.textAlignment = .left
        venueNameLabel.numberOfLines = 0
        venueNameLabel.text = venue?.venue.name
        
        venueDescriptionLabel.setFontSize(to: 17, type: .regular, color: .lightGray)
        venueDescriptionLabel.textAlignment = .left
        venueDescriptionLabel.numberOfLines = 0
        venueDescriptionLabel.text = venue?.venue.description
        
        
        venueStatusLabel.setFontSize(to: 17, type: .regular, color: .white)
        venueStatusLabel.text = (venue?.venue.isOpen ?? false) ? "Opened" : "Currently Closed"
        venueStatusLabel.textAlignment = .center
        venueStatusLabel.backgroundColor = (venue?.venue.isOpen ?? false) ? UIColor(named: "Orange") : .lightGray
        venueStatusLabel.layer.masksToBounds = true
        venueStatusLabel.layer.cornerRadius = 8
    }
    
    private func setupButtons() {
        logoutButton.setTitleColor(.black, for: .normal)
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.layer.cornerRadius = 16
        logoutButton.layer.borderWidth = 1
        logoutButton.layer.borderColor = UIColor.lightGray.cgColor
    }
}
