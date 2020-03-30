//
//  UserDetailsViewController.swift
//  Sample4VArchitecture
//
//  Created by Paweł Trojan on 29/03/2020.
//  Copyright © 2020 Paweł Trojan. All rights reserved.
//

import UIKit

final class UserDetailsViewController: UIViewController {
    
    // MARK: - Private stored property
    private unowned let viewModel: UserDetailsViewModel
    private var userView: UserDetailsView? {
        return view as? UserDetailsView
    }
    
    // MARK: - Internal methods
    init(viewModel: UserDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UserDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userView?.setupView(with: viewModel.getUserDetailsViewData())
        userView?.closeButtonClosure = { [weak self] in
            guard let self = self else { return }
            self.viewModel.closeButtonDidTap()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        /// for back button when is tapped we have to remove presener from router
        if self.isMovingFromParent {
            self.viewModel.closeButtonDidTap()
        }
    }
}
