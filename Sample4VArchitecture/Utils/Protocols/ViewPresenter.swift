//
//  ViewPresenter.swift
//  Sample4VArchitecture
//
//  Created by Paweł Trojan on 29/03/2020.
//  Copyright © 2020 Paweł Trojan. All rights reserved.
//

import UIKit

protocol ViewPresenter: class {
    func show(in parentViewController: UIViewController)
    func close()
}
