//
//  Item.swift
//  Todoey
//
//  Created by abdelkahar mostafa on 2/27/19.
//  Copyright © 2019 abdelkahar mostafa. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title = ""
    @objc dynamic var done  = false
    @objc dynamic var date : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
