//
//  HomeScreenViewController.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import Foundation

import UIKit

import CoreData


protocol HomeScreenViewProtocol: class {
    
    var presenter: HomeScreenPresenterProtocol? { get set }
    
    func viewHomeScreenSuccess(message: String,HomeScreenSuccess:[String:Any])
    
}

class HomeScreenViewController: UIViewController,HomeScreenViewProtocol,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var foodcollectionview: UICollectionView!
    
    @IBOutlet weak var giftcollectionview: UICollectionView!
    
    @IBOutlet weak var drinkcollectionview: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == foodcollectionview{
          
        }
        else if collectionView == giftcollectionview{
         
        }
       else {
           return 10
        }
     return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == foodcollectionview{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCollectionViewCell", for: indexPath) as! FoodCollectionViewCell
           
            return cell
            
        }
        else if collectionView == giftcollectionview {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCollectionViewCell", for: indexPath) as! GiftCollectionViewCell
            return cell
           
        }
        
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DrinkCollectionViewCell", for: indexPath) as! DrinkCollectionViewCell
            return cell
        }
        
      
    }
    
    
    var presenter: HomeScreenPresenterProtocol?
    
    var HomeScreenResult : [String:Any]?
    
    
    
    var notes = [Firstresponse]()
    
    func viewHomeScreenSuccess(message: String, HomeScreenSuccess: [String:Any])  {
        print(HomeScreenSuccess)
        HomeScreenResult = HomeScreenSuccess
        
       
        
    }
    
    func getNotes() {
        let noteFetch = Firstresponse.fetchRequest()
        
        do {
            let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let records = try managedContext.fetch(Firstresponse.fetchRequest())
            let jsonData = try JSONEncoder().encode(records)
            
            print(jsonData)
        } catch {
            print("Error fetching data from CoreData", error)
        }
        
        do {
            let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try managedContext.fetch(noteFetch)
            notes = results
            print(notes)
            
        }
        
        catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNotes()
        
       
        foodcollectionview.delegate = self
        foodcollectionview.dataSource = self
        giftcollectionview.delegate = self
        giftcollectionview.dataSource = self
        drinkcollectionview.delegate = self
        drinkcollectionview.dataSource = self
        
        print("first screen")
        
        foodcollectionview.register(UINib(nibName: "FoodCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodCollectionViewCell")
        giftcollectionview.register(UINib(nibName: "GiftCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GiftCollectionViewCell") 
        drinkcollectionview.register(UINib(nibName: "DrinkCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DrinkCollectionViewCell")
        
        presenter?.presentingHomeScreenDetails()

        // Do any additional setup after loading the view.
    }

    @IBAction func Buttonaction(_ sender: Any) {
        
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
