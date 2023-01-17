//
//  SceneDelegate.swift
//  MusicPlayer
//
//  Created by Дария Григорьева on 08.01.2023.
//

import UIKit
import Firebase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let viewController = RegistrationViewController()
        let navigationController = UINavigationController (rootViewController: viewController)
        window?.rootViewController = navigationController
        let firstVC = TabBarController()
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
    }
}
