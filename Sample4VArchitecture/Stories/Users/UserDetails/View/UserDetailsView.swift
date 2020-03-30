//
//  UserDetailsView.swift
//  Sample4VArchitecture
//
//  Created by Paweł Trojan on 29/03/2020.
//  Copyright © 2020 Paweł Trojan. All rights reserved.
//

import UIKit

fileprivate enum Consts {
    static let userLabelTopMargin: CGFloat = 150
}

class UserDetailsView: UIView {
    
    // MARK: - Internal closures
    var closeButtonClosure: (()->())?
    
    // MARK: - Private stored property
    private let userLabel = FactoryView.userLabel
    private let closeButton = FactoryView.closeButton
    
    // MARK: - Interal methods
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) { return nil }
    
    func setupView(with viewData: UserDetailsViewData) {
        userLabel.text = viewData.userName
    }
    
    // MARK: - Private methods
    private func setupView() {
        backgroundColor = .white
        addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            closeButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        addSubview(userLabel)
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: topAnchor, constant: Consts.userLabelTopMargin),
            userLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    @objc private func closeButtonTapped() {
        closeButtonClosure?()
    }
}

fileprivate enum FactoryView {
    static var userLabel: UILabel {
        let label = UILabel()
        label.textColor = .red
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }
    
    static var closeButton: UIButton {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        return button
    }
}
