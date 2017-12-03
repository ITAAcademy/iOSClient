//
//  FirstScreenModuleBuilder.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/3/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import UIKit

class FirstScreenModuleBuilder: ModuleBuilderProtocol
{
    
    
    func buildView() -> UIViewController {
        let storyboard = UIStoryboard(name: "FirstScreen", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "FirstScreenViewController")
        configure(controller: controller)
        return UINavigationController(rootViewController: controller)
    }
    
    private func configure(controller: UIViewController)
    {
        guard let controller = controller as? FirstScreenViewController else { return }
        let presenter: FirstScreenPresenterProtocol = FirstScreenPresenter()
        let router: FirstScreenRouterProtocol = FirstScreenRouter()
        let interactor = FirstScreenInteractor()
        controller.presenter = presenter
        presenter.router = router
        router.presenter = presenter
        presenter.view = controller
        presenter.interactor = interactor
        interactor.presenter = presenter
        
    }
}
