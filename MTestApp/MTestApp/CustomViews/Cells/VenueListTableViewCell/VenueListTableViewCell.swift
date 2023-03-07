//
//  VenueListTableViewCell.swift
//  MtestApp
//
//  Created by Lazar Andonov on 7.3.23..
//

import UIKit

class VenueListTableViewCell: UITableViewCell {
    
    // MARK: - Static Properties
    static let cellIdentifier = "VenueListTableViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var venueNameLabel: CustomLabel!
    @IBOutlet weak var venueDistanceLabel: CustomLabel!
    @IBOutlet weak var venueAddressLabel: CustomLabel!
    @IBOutlet weak var venueWorkingTimeLabel: CustomLabel!

    // MARK: - Awake From Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
 
    // MARK: - Methods
    func configureCellWithVenue(_ venue: Venue) {
        venueNameLabel.text = venue.venue.name
        venueDistanceLabel.text = DistanceHelper.distanceString(for: venue.distanceInMiles)
        venueAddressLabel.text = venue.venue.address
        venueWorkingTimeLabel.text = venue.venue.isOpen ? "Opened" : "Closed"
        
        venueNameLabel.textColor = venue.venue.isOpen ? .black : .lightGray
        venueDistanceLabel.textColor = venue.venue.isOpen ? .black : .lightGray
    }
}

// MARK: - Private Methods
extension VenueListTableViewCell {
    private func setup() {
        selectionStyle = .none
        
        venueNameLabel.setFontSize(to: 16, type: .bold, color: .black)
        venueNameLabel.textAlignment = .left
        venueNameLabel.numberOfLines = 0
        
        venueDistanceLabel.setFontSize(to: 16, type: .bold, color: .black)
        venueDistanceLabel.textAlignment = .left
        
        venueAddressLabel.setFontSize(to: 16, type: .regular, color: .lightGray)
        venueAddressLabel.textAlignment = .left
        venueAddressLabel.numberOfLines = 0
        
        venueWorkingTimeLabel.setFontSize(to: 16, type: .regular, color: .lightGray)
        venueWorkingTimeLabel.textAlignment = .left
    }
}
