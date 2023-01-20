//
//  TabBarController.swift
//  CookBook
//
//  Created by Александр Косяков on 11.01.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setupTabBar()
    }
  
    // MARK: - Private Method
    
    private func generateTabBar() {
        viewControllers = [
            
            generateVC(
                viewController: MainScreenViewController(),
                image: UIImage(systemName: "house.fill")
            ),
            
            generateVC(
                viewController: FavouritesViewController(),
                image: UIImage(systemName: "heart")
            ),
            
//            generateVC(
//                viewController: SoundLayerController(),
//                image: UIImage(systemName: "play.circle")
//            ),
            
            generateVC(
                viewController: DownloadsViewController(),
                image: UIImage(systemName: "square.and.arrow.down")
            ),
            
            generateVC(
                viewController: UserInfoViewController(),
                image: UIImage(systemName: "person")
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController,image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return UINavigationController(rootViewController: viewController)
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .gray
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
