//
//  UserDetailsViewPresenter.swift
//  Sample4VArchitecture
//
//  Created by Paweł Trojan on 29/03/2020.
//  Copyright © 2020 Paweł Trojan. All rights reserved.
//

import UIKit

final class UserDetailsViewPresenter {
    
    // MARK: - Private stored property
    private let viewFactory: UserDetailsViewFactory
    
    // MARK: - Internal methods
    init(userModel: UserModel, navigationDelegate: UserDetailsNavigationDelegate) {
        viewFactory = UserDetailsViewFactory(userModel: userModel, navigationDelegate: navigationDelegate)
    }
}

// MARK: - UserDetailsViewPresenter
extension UserDetailsViewPresenter: ViewPresenter {
    func show(in parentViewController: UIViewController) {
        parentViewController.show(viewFactory.viewController, sender: nil)
    }
    
    func close() {
        viewFactory.viewController.navigationController?.popViewController(animated: true)
    }
}
