//
//  VenueListViewController.swift
//  MtestApp
//
//  Created by Lazar Andonov on 7.3.23..
//

import UIKit

class VenueListViewController: BaseViewController {

    // MARK: - Properties
    var venueListView: VenueListView {
        loadViewIfNeeded()
        return view as! VenueListView
    }
    
    var presenter: VenueListPresenter?
    
    // MARK: - Private DataSource Properties
    private var dataSource: [Venue] = [] {
        didSet {
            DispatchQueue.main.async {
                self.venueListView.refreshControl.endRefreshing()
                self.venueListView.tableView.reloadData()
            }
        }
    }
        
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchData()
    }
}

// MARK: - Private Methods
extension VenueListViewController {
    private func setup() {
        title = "Venues"
        venueListView.setup()
        setupDelegates()
        setupTargets()
    }
    
    private func setupDelegates() {
        presenter?.delegate = self
        venueListView.tableView.delegate = self
        venueListView.tableView.dataSource = self
    }
    
    private func setupTargets() {
        venueListView.refreshControl.addTarget(
            self, action: #selector(refresControlAction), for: .valueChanged)
    }
    
    private func fetchData() {
        presenter?.getVenues(getVenueRequestModel())
    }
}

// MARK: - Private Targets
extension VenueListViewController {
    private func getVenueRequestModel() -> VenueRequestModel {
        return VenueRequestModel(latitude: "44.001783", longitude: "21.26907")
    }
    
    @objc private func refresControlAction() {
        fetchData()
    }
}

// MARK: - VenueListPresenterDelegate
extension VenueListViewController: VenueListPresenterDelegate {
    func venueListPresenter(_ presenter: VenueListPresenter, didFetchVenues venues: [Venue]) {
        dataSource = venues
    }
}

// MARK: - UITableViewDelegate
extension VenueListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let venue = dataSource[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Venue", bundle: nil)
        guard let venueDetailsViewController = storyboard
            .instantiateViewController(withIdentifier: "VenueDetailsViewController") as? VenueDetailsViewController else { return }
        venueDetailsViewController.presenter = VenueDetailsPresenter(venue: venue)
        self.navigationController?.pushViewController(venueDetailsViewController, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension VenueListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: VenueListTableViewCell.cellIdentifier,
            for: indexPath) as? VenueListTableViewCell else { return UITableViewCell() }
        
        let venue = dataSource[indexPath.row]
        cell.configureCellWithVenue(venue)
        
        return cell
    }
}
