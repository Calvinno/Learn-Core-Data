//
//  User+CoreDataProperties.swift
//  Learning Core Data
//
//  Created by Calvin Cantin1 on 2019-04-10.
//  Copyright © 2019 Calvin. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String

}
