//
//  MainModuleBuilder.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/3/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import UIKit

class MainModuleBuilder: ModuleBuilderProtocol
{
    func buildView() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MainTabBarController")
        let firstScreenBuilder = FirstScreenModuleBuilder()
        
        let tabOneController = firstScreenBuilder.buildView()
        tabOneController.tabBarItem = UITabBarItem(title: "First", image: nil, selectedImage: nil)
        
        let tabTwoController = firstScreenBuilder.buildView()
        tabTwoController.tabBarItem = UITabBarItem(title: "Second", image: nil, selectedImage: nil)
        
        if let tabbarController = controller as? UITabBarController
        {
            tabbarController.viewControllers = [UINavigationController(rootViewController: tabOneController), tabTwoController]
        }
        return controller
    }
    
    
}
