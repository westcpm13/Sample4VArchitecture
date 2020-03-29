//
//  UsersListViewModel.swift
//  Sample4VArchitecture
//
//  Created by Paweł Trojan on 29/03/2020.
//  Copyright © 2020 Paweł Trojan. All rights reserved.
//

import Foundation

protocol UsersListViewModelDelegate: class {
    func usersListUpdated()
}

final class UsersListViewModel {

    // MARK: - Internal computed property
    var usersCount: Int {
        return users.count
    }
    
    // MARK: - Private stored property
    private weak var viewDelegate: UsersListViewModelDelegate?
    private weak var navigationDelegate: UsersListNavigationDelegate?
    private let usersListInteractor: UsersListInteractor
    private var users = [UserModel]()

    init(usersListInteractor: UsersListInteractor, navigationDelegate: UsersListNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
        self.usersListInteractor = usersListInteractor
        loadUsers()
    }

    // MARK: - Internal methods
    func getUsersListViewCellViewData(at indexPath: IndexPath) -> UsersListViewCellViewData {
        return UsersListViewCellViewData(name: self.user(at: indexPath).name)
    }
    
    func userDetailsSelected(at indexPath: IndexPath) {
        let user = self.user(at: indexPath)
        navigationDelegate?.usersListSelected(for: user)
    }
    
    func setupViewDelegate(_ delegate: UsersListViewModelDelegate) {
        viewDelegate = delegate
    }
    
    // MARK: - Private methods
    private func loadUsers() {
        usersListInteractor.fetchUsers { [weak self] users in
            guard let self = self else { return }
            self.users = users
            DispatchQueue.main.async {
                self.viewDelegate?.usersListUpdated()
            }
        }
    }

    private func user(at indexPath: IndexPath) -> UserModel {
        return users[indexPath.row]
    }
}
