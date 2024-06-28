//
//  TabBarViewController.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 16.06.24.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .appBackground
        self.tabBar.tintColor = .appPrimary
        self.tabBar.unselectedItemTintColor = .lightGray
        
        let homeTab = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        let homeVC = UINavigationController(rootViewController:  HomeViewController())
        homeVC.tabBarItem = homeTab
        
        let searchTab = UITabBarItem(title: "Explore", image: UIImage(systemName: "safari"), tag: 1)
        let searchVC = UIViewController()
        searchVC.tabBarItem = searchTab
        
        let profileTab = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 2)
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        profileVC.tabBarItem = profileTab
        
        viewControllers = [homeVC, searchVC, profileVC]
    }
}
