//
//  VenueListPresenter.swift
//  MtestApp
//
//  Created by Lazar Andonov on 7.3.23..
//

import Foundation

protocol VenueListPresenterDelegate: BaseDelegate {
    func venueListPresenter(_ presenter: VenueListPresenter, didFetchVenues venues: [Venue])
}

class VenueListPresenter {
    
    // MARK: - Properties
    weak var delegate: VenueListPresenterDelegate?
    
    // MARK: - Private Properties
    private var api: API?
    
    // MARK: - Init
    init(token: String) {
        self.api = API(token: token)
    }
    
    // MARK: - Methods
    func getVenues(_ model: VenueRequestModel) {
        delegate?.showLoader()
        api?.getVenues(model,
            didGetVenuesData: { [weak self] (venues) in
                guard let self = self else { return }
                self.delegate?.hideLoader()
                self.delegate?.venueListPresenter(self, didFetchVenues: venues)
            },
            didFinishWithError: { [weak self] (error) in
                self?.delegate?.handleAPIError(error)
            })
    }
}
