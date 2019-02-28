//
//  Category.swift
//  Todoey
//
//  Created by abdelkahar mostafa on 2/27/19.
//  Copyright © 2019 abdelkahar mostafa. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name = ""
    let items = List<Item>()
}
