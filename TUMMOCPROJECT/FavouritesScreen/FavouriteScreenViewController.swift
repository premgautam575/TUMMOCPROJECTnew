//
//  FavouriteScreenViewController.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import UIKit

class FavouriteScreenViewController: UIViewController {

    var presenter : FavouriteScreenPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("favouritescreen")
        presenter?.displayfavouriteitems()
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
