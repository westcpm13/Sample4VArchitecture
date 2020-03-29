//
//  UsersListViewCell.swift
//  Sample4VArchitecture
//
//  Created by Paweł Trojan on 29/03/2020.
//  Copyright © 2020 Paweł Trojan. All rights reserved.
//

import UIKit

fileprivate enum Consts {
    static let nameLabelLeading: CGFloat = 16
}

final class UsersListViewCell: UITableViewCell {
    
    // MARK: - Private stored property
    private let nameLabel = FactoryView.nameLabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) { return nil }
    
    private func setupView() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Consts.nameLabelLeading)
        ])
    }
}

// MARK: - TableViewCellDataConfiguring protocol
extension UsersListViewCell: TableViewCellDataConfiguring {
    
    func configure(viewData: UsersListViewCellViewData) {
        nameLabel.text = viewData.name
    }
}

// MARK: - FactoryView
fileprivate enum FactoryView {
    static var nameLabel: UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }
}

