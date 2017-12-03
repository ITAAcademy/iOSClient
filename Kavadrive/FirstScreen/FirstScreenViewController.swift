//
//  FirstScreenViewController.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/3/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController, FirstScreenViewProtocol {

    
    
    var presenter: FirstScreenPresenterProtocol!
    

    @IBOutlet weak var localCheckoutHeight: NSLayoutConstraint!
    @IBOutlet weak var localCheckoutContainer: UIView!
    @IBOutlet weak var productListContainer: UIView!
    
    weak var bottomController: UIViewController?
    weak var upperController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showUpper(controller: UIViewController) {
        hideController(controller: upperController)
        showController(controller: controller, inView: localCheckoutContainer)
        upperController = controller
    }
    
    func showBottom(controller: UIViewController) {
        hideController(controller: bottomController)
        showController(controller: controller, inView: productListContainer)
        bottomController = controller
    }
    
    
    private func hideController(controller: UIViewController?)
    {
        guard let controller = controller else { return }
        controller.willMove(toParentViewController: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParentViewController()
    }
    
    private func showController(controller: UIViewController, inView: UIView)
    {
        self.addChildViewController(controller)
        controller.view.frame = inView.bounds
        inView.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
    }
    
    var isUpperHidden: Bool = true {
        didSet {
            if isUpperHidden
            {
                localCheckoutHeight.constant = 0
            }
            else
            {
                localCheckoutHeight.constant = 128
            }
        }
    }

}
