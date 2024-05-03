//
//  HomeScreenPresenter.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import Foundation

import UIKit

protocol HomeScreenPresenterProtocol: class {
    

    var interactor: HomeScreenInteractorInputProtocol?{get set}
  
    func presentingHomeScreenDetails()
    
    func presentingToFavouriteScreen()

}

protocol HomeScreenInteractorOutputProtocol: class {
    
    func interactorHomeScreenSuccess(messageStr:String,HomeScreenSuccess:[String:Any])
    
}

class HomeScreenPresenter: HomeScreenPresenterProtocol, HomeScreenInteractorOutputProtocol {
    
    func presentingHomeScreenDetails() {
        
        print("secondscreen")
        
        interactor?.interactorHomeScreen()
        
    }
    
    func presentingToFavouriteScreen() {
        router.routeToFavouriteScreen()
    }
    
    func interactorHomeScreenSuccess(messageStr: String, HomeScreenSuccess:[String:Any]) {
       view?.viewHomeScreenSuccess(message: messageStr, HomeScreenSuccess: HomeScreenSuccess)
        
    }
    
    weak private var view: HomeScreenViewProtocol?
    var interactor: HomeScreenInteractorInputProtocol?
    private var router: HomeScreenWireframeProtocol
    
    init(interface: HomeScreenViewProtocol, interactor: HomeScreenInteractorInputProtocol?, router: HomeScreenWireframeProtocol) {
        
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
