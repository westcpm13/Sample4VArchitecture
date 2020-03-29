//
//  UserDetailsView.swift
//  Sample4VArchitecture
//
//  Created by Paweł Trojan on 29/03/2020.
//  Copyright © 2020 Paweł Trojan. All rights reserved.
//

import UIKit

class UserDetailsView: UIView {
    
    // MARK: - Internal closures
    var closeButtonClosure: (()->())?
    
    // MARK: - Private stored property
    private let closeButton = FactoryView.closeButton
    
    // MARK: - Interal methods
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) { return nil }
    
    // MARK: - Private methods
    private func setupView() {
        backgroundColor = .white
        addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            closeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    @objc private func closeButtonTapped() {
        closeButtonClosure?()
    }
}

fileprivate enum FactoryView {
    static var closeButton: UIButton {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        return button
    }
}
