//
//  SceneDelegate.swift
//  Sample4VArchitecture
//
//  Created by Paweł Trojan on 28/03/2020.
//  Copyright © 2020 Paweł Trojan. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: Internal stored property
    var window: UIWindow?
    
    // MARK: Private stored property
    private var mainRouter: Router?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = UINavigationController()
        window?.rootViewController = rootViewController
        let usersRouter = UsersRouter(parentViewController: rootViewController)
        usersRouter.startStory()
        mainRouter = usersRouter
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
    }
}

