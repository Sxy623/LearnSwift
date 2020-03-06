//
//  Category.swift
//  Todoey
//
//  Created by 沈心逸 on 2020/3/6.
//  Copyright © 2020 Xinyi Shen. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
