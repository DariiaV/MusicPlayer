//
//  SceneDelegate.swift
//  MusicPlayer
//
//  Created by Дария Григорьева on 08.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let firstVC = TabBarController()
        window?.makeKeyAndVisible()
        
        let navController = UINavigationController (rootViewController: firstVC)
        window?.rootViewController = navController
    }
}



    
  
    
