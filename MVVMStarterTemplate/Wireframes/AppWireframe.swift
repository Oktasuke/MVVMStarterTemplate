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
    func goToArticlesScreen()
    func goToSearchScreen()
    func gotToSettingScreen()
}

class AppWireframe: BaseAppWireframe {
    private weak var navigationController: UINavigationController?
    
    init(on navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goToArticlesScreen() {
        let articlesViewController = ArticlesViewController(dependency: self)
        self.navigationController?.setViewControllers([
            articlesViewController
            ], animated: false)
    }
    
    func goToSearchScreen() {
        let viewController = SearchViewController(dependency: self)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func gotToSettingScreen() {
        let viewContoller = SettingViewController(dependency: self)
        self.navigationController?.pushViewController(viewContoller, animated: true)
    }
    
    static func bootstrap(on window: UIWindow) -> AppWireframe {
        let navigationController = UINavigationController()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return AppWireframe(on: navigationController)
    }
}
