//
//  HomeScreenResponse.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import Foundation


struct HomeScreenResponse : Codable {
    
    var status : Bool
    var message: String
    var categories : [Categorydata]?
    
}

struct Categorydata : Codable {
    var id : Int
    var items : [ItemsData]
}

struct ItemsData : Codable {
    var id : Int
    var name : String
    var icon : String
    var price : Int
    
}


