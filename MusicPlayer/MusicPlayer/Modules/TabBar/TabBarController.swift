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
        setTabBarAppearance()
    }
  
    // MARK: - Private Method
    
    private func generateTabBar() {
        viewControllers = [
            
            generateVC(
                viewController: RegistrationViewController(),
                image: UIImage(systemName: "house.fill")
            ),
            
            generateVC(
                viewController: FavouritesViewController(),
                image: UIImage(systemName: "heart")
            ),
            
            generateVC(
                viewController: SoundLayerController(),
                image: UIImage(systemName: "play.circle")
            ),
            
            generateVC(
                viewController: DownloadsViewController(),
                image: UIImage(systemName: "square.and.arrow.down")
            ),
            
            generateVC(
                viewController: RegistrationViewController(),
                image: UIImage(systemName: "person")
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController,image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return UINavigationController(rootViewController: viewController)
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 3
        let positionOnY: CGFloat = 3
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        let roundLayer = CAShapeLayer()

        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: 1
        )

        roundLayer.path = bezierPath.cgPath
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
