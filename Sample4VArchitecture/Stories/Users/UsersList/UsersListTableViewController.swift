//
//  ViewController.swift
//  Sample4VArchitecture
//
//  Created by Paweł Trojan on 28/03/2020.
//  Copyright © 2020 Paweł Trojan. All rights reserved.
//

import UIKit

class UsersListViewController: UITableViewController {

    // MARK: - Private stored property
    private unowned let viewModel: UsersListViewModel

    // MARK: - Internal methods
    init(viewModel: UsersListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private methods
    private func setupView() {
        viewModel.setupViewDelegate(self)
        tableView.register(UsersListViewCell.self)
    }
}

// MARK: - TableView datasource
extension UsersListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.usersCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UsersListViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(viewData: viewModel.getUsersListViewCellViewData(at: indexPath))
        return cell
    }
}

// MARK: - TableView delegate
extension UsersListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.userDetailsSelected(at: indexPath)
    }
}

// MARK: - UsersListViewModelDelegate
extension UsersListViewController: UsersListViewModelDelegate {
   
    func usersListUpdated() {
        tableView.reloadData()
    }
}
