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

struct NWSSymbolExplanation: Decodable {
    var dateTime: String? {
        get {
            return convertDateToReadableString(_dateTime)
        }
    }
    private var _dateTime: String?

    private enum CodingKeys: String, CodingKey {
        case _dateTime = "dateTime"
    }
}
private func convertDateToReadableString(_ dateTime: String?) -> String {
    guard let dateTime = dateTime else { return ""}
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm E, d MMM y"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    let date = dateFormatter.date(from:dateTime)!
    return dateFormatter.string(from: date)
}
