//
//  HomeScreenRouter.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import Foundation

import UIKit

protocol HomeScreenWireframeProtocol: class {
    
    func routeToFavouriteScreen()
    
}

class HomeScreenRouter: HomeScreenWireframeProtocol {
    func routeToFavouriteScreen() {
        print("")
    }
    
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = HomeScreenViewController(nibName: nil, bundle: nil)
        let interactor = HomeScreenInteractor()
        let router = HomeScreenRouter()
        let presenter = HomeScreenPresenter(interface: view, interactor: interactor, router: router)
       
        //weak private var view: HomeScreenViewProtocol?
        //var interactor: HomeScreenInteractorInputProtocol?
       // private let router: HomeScreenWireframeProtocol
        
        view.presenter = presenter as? HomeScreenPresenterProtocol
        interactor.presenter = presenter as? HomeScreenInteractorOutputProtocol
        presenter.interactor = interactor as? HomeScreenInteractorInputProtocol
        
        router.viewController = view
        
        return view
        
       
  
    }
}
