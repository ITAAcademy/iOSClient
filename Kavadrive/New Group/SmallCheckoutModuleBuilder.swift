//
//  SmallCheckoutModuleBuilder.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/3/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import UIKit

class SmallCheckoutModuleBuilder: ModuleBuilderProtocol
{
    
    
    func buildView() -> UIViewController {
        let storyboard = UIStoryboard(name: "Checkout", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SmallCheckoutStubController")
        configure(controller: controller)
        return controller
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

