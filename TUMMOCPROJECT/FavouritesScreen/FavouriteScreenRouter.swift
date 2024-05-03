//
//  FavouriteScreenRouter.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import Foundation


import UIKit

class FavouriteScreenRouter: FavouriteScreenWireframeProtocol {
    
    func routeToCartScreen() {
        print("")
    }
    
 
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        
        // Change to get view from storyboard if not using progammatic UI
        let view = FavouriteScreenViewController(nibName: nil, bundle: nil)
        let interactor = FavouriteScreenInteractor()
        let router = FavouriteScreenRouter()
        let presenter = FavouriteScreenPresenter(interface: view as! FavouriteScreenViewProtocol, interactor: interactor, router: router)


        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
