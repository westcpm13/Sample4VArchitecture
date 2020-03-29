//
//  UsersListViewFactory.swift
//  Sample4VArchitecture
//
//  Created by Paweł Trojan on 29/03/2020.
//  Copyright © 2020 Paweł Trojan. All rights reserved.
//

final class UsersListViewFactory {
    
    // MARK: - Internal stored property
    let viewController: UsersListViewController
    // MARK: - Private stored property
    private let viewModel: UsersListViewModel
    
    // MARK: - Internal methods
    init(navigationDelegate: UsersListNavigationDelegate) {
        let interactor = UsersListInteractor()
        viewModel = UsersListViewModel(usersListInteractor: interactor, navigationDelegate: navigationDelegate)
        viewController = UsersListViewController(viewModel: viewModel)
    }
}
