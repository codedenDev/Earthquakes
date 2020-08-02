//
//  QuakeModel.swift
//  Earthquakes
//
//  Created by Richard Kelly on 02/08/2020.
//  Copyright © 2020 Richard Kelly. All rights reserved.
//

import Foundation

struct QuakesList: Decodable {

    let earthquakes: [Earthquake]
}

struct Earthquake: Decodable {
    let datetime: String
    let depth: Double
    let lng: Double
    let src: String
    let eqid: String
    let magnitude: Double
    let lat: Double
}
