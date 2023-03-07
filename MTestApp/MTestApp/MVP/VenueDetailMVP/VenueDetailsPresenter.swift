//
//  VenueDetailsPresenter.swift
//  MtestApp
//
//  Created by Lazar Andonov on 7.3.23..
//

import Foundation

protocol VenueDetailsPresenterDelegate: BaseDelegate {
    func venueDetailsPresenterDidLogout()
}

class VenueDetailsPresenter {
    
    // MARK: - Properties
    var venue: Venue
    
    // MARK: - Delegate Properties
    weak var delegate: VenueDetailsPresenterDelegate?
    
    // MARK: - Init
    init(venue: Venue) {
        self.venue = venue
    }
    
    // MARK: - Methods
    func logout() {
        delegate?.showLoader()
        DataBaseHelper.removeUser()
        self.delegate?.hideLoader()
        self.delegate?.venueDetailsPresenterDidLogout()
    }
    
}
