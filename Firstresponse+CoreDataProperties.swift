//
//  Firstresponse+CoreDataProperties.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 05/05/24.
//
//

import Foundation
import CoreData
import UIKit

extension Firstresponse {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Firstresponse> {
        return NSFetchRequest<Firstresponse>(entityName: "Firstresponse")
    }

    @NSManaged public var categories: Data?

}

extension Firstresponse : Identifiable,Encodable {

    private enum CodingKeys: String, CodingKey { case data}

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(categories, forKey: .data)
    }
    
}
