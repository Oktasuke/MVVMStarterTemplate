//
//  AppWireFrames.swift
//  MVVMStarterTemplate
//
//  Created by taisuke.okada on 2018/05/02.
//  Copyright © 2018年 Oktasuke. All rights reserved.
//

import Foundation
import UIKit

protocol BaseAppWireframe {
    func goToHomeTab()
    func goToSearchTab()
    func goToSettingTab()
    func goToSearchScreen()
    func gotToSettingScreen()
}

enum bottomTabBarItems: Int {
    case home
    case search
    case setting
}

class AppWireframe: BaseAppWireframe {
    private weak var coordinator: UINavigationController?
    private weak var bottomTabNavigation: UITabBarController?
    
    init(on navigationController: UINavigationController) {
        self.coordinator = navigationController
        
        let homeViewController = HomeViewController(dependency: self)
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.mostViewed, tag: bottomTabBarItems.home.rawValue)
        
        let searchViewController = SearchViewController(dependency: self)
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.search, tag: bottomTabBarItems.search.rawValue)
        
        let settingViewContrller = SettingViewController(dependency: self)
        settingViewContrller.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.more, tag: bottomTabBarItems.setting.rawValue)
        
        let bottomTabNavigation = UITabBarController()
        self.bottomTabNavigation = bottomTabNavigation
        bottomTabNavigation.setViewControllers([homeViewController, searchViewController, settingViewContrller], animated: false)
        self.coordinator?.setViewControllers([bottomTabNavigation], animated: false)
    }
    
    func goToHomeTab() {
        self.coordinator?.popToRootViewController(animated: false)
        self.bottomTabNavigation?.selectedIndex = bottomTabBarItems.home.rawValue
    }
    
    func goToSearchTab(){
        self.coordinator?.popToRootViewController(animated: false)
        self.bottomTabNavigation?.selectedIndex = bottomTabBarItems.search.rawValue
    }
    
    func goToSettingTab(){
        self.coordinator?.popToRootViewController(animated: false)
        self.bottomTabNavigation?.selectedIndex = bottomTabBarItems.setting.rawValue
    }
    
    func goToSearchScreen() {
        let viewController = SearchViewController(dependency: self)
        self.coordinator?.pushViewController(viewController, animated: false)
    }
    
    func gotToSettingScreen() {
        let viewContoller = SettingViewController(dependency: self)
        self.coordinator?.pushViewController(viewContoller, animated: true)
    }
    
    static func bootstrap(on window: UIWindow) -> AppWireframe {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return AppWireframe(on: navigationController)
    }
}
