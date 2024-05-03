//
//  HomeScreenInteractor.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import Foundation
import UIKit
import CoreData

protocol HomeScreenInteractorInputProtocol: class {
    
    var presenter: HomeScreenInteractorOutputProtocol? {get set}
    
    func interactorHomeScreen()
}

class HomeScreenInteractor: HomeScreenInteractorInputProtocol {

    var jsonresult : [Categorydata]?
    
    weak var presenter: HomeScreenInteractorOutputProtocol?
    
    func interactorHomeScreen()  {
        
        let url = Bundle.main.url(forResource: "shopping", withExtension: "json")
        
        print(url)
        
        print("third screen")
        
        let data = try? Data(contentsOf: url!, options: .alwaysMapped)
        
        let jsondata = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:Any] ?? [:]
        
        let jsonobject  = try? JSONSerialization.data(withJSONObject: jsondata, options: .prettyPrinted)
        
        let finaldata = try? JSONDecoder().decode([Categorydata].self, from: jsonobject!)
        
        print(jsondata)
        
        jsonresult = jsondata as? [Categorydata]
        
        print(jsonobject)
      
        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        
        let newNote1 = Firstresponse(context: context)
        
        newNote1.setValue(jsondata as? [Categorydata] , forKey: #keyPath(Firstresponse.categories))
        
        presenter?.interactorHomeScreenSuccess(messageStr: "messsage", HomeScreenSuccess: jsondata! )
        
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()

    }
}
