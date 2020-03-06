//
//  Item.swift
//  Todoey
//
//  Created by 沈心逸 on 2020/3/6.
//  Copyright © 2020 Xinyi Shen. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
