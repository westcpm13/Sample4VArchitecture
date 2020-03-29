//
//  UsersRooter.swift
//  Sample4VArchitecture
//
//  Created by Paweł Trojan on 29/03/2020.
//  Copyright © 2020 Paweł Trojan. All rights reserved.
//

import UIKit

protocol UsersListNavigationDelegate: class {
    func usersListSelected(for user: UserModel)
}

protocol UserDetailsNavigationDelegate: class {
    func userDetailsCloseDidTap()
}

fileprivate enum Presenters: String {
    case usersList
    case userDetails
}

final class UsersRouter: Router {
    
    // MARK: - Private stored properties
    private let parentViewController: UIViewController
    private var presenters = [String: ViewPresenter]()
    
    // MARK: - Internal methods
    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
    }
    
    func startStory() {
        let usersListPresenter = UsersListViewPresenter(navigationDelegate: self)
        usersListPresenter.show(in: parentViewController)
        presenters[Presenters.usersList.rawValue] = usersListPresenter
    }

    func closeStory() {
        presenters.keys.forEach { [unowned self] in
            self.removePresenter(for: $0)
        }
    }
    
    // MARK: - Private methods
    private func removePresenter(for key: String) {
        let userDetailsPresenter = presenters[key]
        userDetailsPresenter?.close()
        presenters[key] = nil
    }
}

// MARK: - UsersListNavigationDelegate
extension UsersRouter: UsersListNavigationDelegate {
    func usersListSelected(for user: UserModel) {
        let userDetailsPresenter = UserDetailsViewPresenter(userModel: user, navigationDelegate: self)
        userDetailsPresenter.show(in: parentViewController)
        presenters[Presenters.userDetails.rawValue] = userDetailsPresenter
    }
}

// MARK: - UserDetailsNavigationDelegate
extension UsersRouter: UserDetailsNavigationDelegate {
    func userDetailsCloseDidTap() {
        removePresenter(for: Presenters.userDetails.rawValue)
    }
}
