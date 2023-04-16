//
//  SceneDelegate.swift
//  NewsApp
//
//  Created by Эл on 05.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

        func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = (scene as? UIWindowScene) else { return }

            let builder = Builder()
            let navigationController = UINavigationController()
            let router = Router(navController: navigationController, builder: builder)
            router.initialController()

            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
    }

    


}

