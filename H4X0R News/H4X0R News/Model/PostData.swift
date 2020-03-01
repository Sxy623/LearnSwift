//
//  PostData.swift
//  H4X0R News
//
//  Created by 沈心逸 on 2020/3/1.
//  Copyright © 2020 Xinyi Shen. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
