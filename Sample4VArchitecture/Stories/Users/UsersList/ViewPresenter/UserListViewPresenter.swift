//
//  UserListViewPresenter.swift
//  Sample4VArchitecture
//
//  Created by Paweł Trojan on 29/03/2020.
//  Copyright © 2020 Paweł Trojan. All rights reserved.
//

import UIKit

final class UsersListViewPresenter {
 
    private let viewFactory: UsersListViewFactory

    init(navigationDelegate: UsersListNavigationDelegate) {
        viewFactory = UsersListViewFactory(navigationDelegate: navigationDelegate)
    }
}

// MARK: - ViewPresenter
extension UsersListViewPresenter: ViewPresenter {
    
    func show(in parentViewController: UIViewController) {
        parentViewController.show(viewFactory.viewController, sender: nil)
    }
        
    func close() {
        viewFactory.viewController.dismiss(animated: true)
    }
}
