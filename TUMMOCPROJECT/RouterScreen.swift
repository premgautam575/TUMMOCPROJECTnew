//
//  RouterScreen.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 05/05/24.
//

import Foundation
import UIKit


class RouterScreen:UIViewController {
    
    override func viewDidLoad() {
        print("routerscreen")
        let vc = HomeScreenRouter.createModule()
        vc.navigationController?.pushViewController(vc, animated: true)
    }
}
