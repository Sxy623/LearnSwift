//
//  WeatherData.swift
//  Clima
//
//  Created by 沈心逸 on 2020/2/19.
//  Copyright © 2020 Xinyi Shen. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
}
