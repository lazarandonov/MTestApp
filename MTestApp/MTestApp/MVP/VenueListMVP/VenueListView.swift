//
//  VenueListView.swift
//  MtestApp
//
//  Created by Lazar Andonov on 7.3.23..
//

import UIKit

class VenueListView: UIView {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - UI Properties
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .black
        return refreshControl
    }()
    
    // MARK: - Setup Method
    func setup() {
        setupTableView()
    }
}

// MARK: - Private Methods
extension VenueListView {
    private func setupTableView() {
        tableView.addSubview(refreshControl)
        let cellNib = UINib(nibName: VenueListTableViewCell.cellIdentifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: VenueListTableViewCell.cellIdentifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = 150
    }
}
