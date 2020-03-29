//
//  UserDetailsViewFactory.swift
//  Sample4VArchitecture
//
//  Created by Paweł Trojan on 29/03/2020.
//  Copyright © 2020 Paweł Trojan. All rights reserved.
//

final class UserDetailsViewFactory {
    
    // MARK: - Internal stored property
    let viewController: UserDetailsViewController
    // MARK: - Private stored property
    private let viewModel: UserDetailsViewModel
    
    // MARK: - Internal methods
    init(userModel: UserModel, navigationDelegate: UserDetailsNavigationDelegate) {
        viewModel = UserDetailsViewModel(userModel: userModel, navigationDelegate: navigationDelegate)
        viewController = UserDetailsViewController(viewModel: viewModel)
    }
}
