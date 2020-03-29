//
//  UserDetailsViewModel.swift
//  Sample4VArchitecture
//
//  Created by Paweł Trojan on 29/03/2020.
//  Copyright © 2020 Paweł Trojan. All rights reserved.
//

import Foundation

final class UserDetailsViewModel {
    
    // MARK: Private stored property
    private var userModel: UserModel
    private weak var navigationDelegate: UserDetailsNavigationDelegate?
    
    // MARK: Internal methods
    init(userModel: UserModel, navigationDelegate: UserDetailsNavigationDelegate) {
        self.userModel = userModel
        self.navigationDelegate = navigationDelegate
    }
    
    func closeButtonDidTap() {
        navigationDelegate?.userDetailsCloseDidTap()
    }
}
