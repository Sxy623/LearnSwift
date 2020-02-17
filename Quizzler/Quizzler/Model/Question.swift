//
//  Question.swift
//  Quizzler
//
//  Created by 沈心逸 on 2020/2/17.
//  Copyright © 2020 Xinyi Shen. All rights reserved.
//

import Foundation

struct Question {
    
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
