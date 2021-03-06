//
//  QuakeViewModel.swift
//  Earthquakes
//
//  Created by Richard Kelly on 02/08/2020.
//  Copyright © 2020 Richard Kelly. All rights reserved.
//

import Foundation


struct QuakeListViewModel {
    let earthquakes: [Earthquake]
}

extension QuakeListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.earthquakes.count
    }
    func earthquakesAtIndex(_ index: Int) -> QuakeViewModel {
        let earthquakes = self.earthquakes[index]
        return QuakeViewModel(earthquakes)
    }
}

struct QuakeViewModel {
    private let earthquake: Earthquake}

extension QuakeViewModel {
    init(_ earthquakes: Earthquake) {
        self.earthquake = earthquakes
    }
}

extension QuakeViewModel {
    var dateTimeLabel: String {
        return self.earthquake.datetime
    }
    var regionLabel: String {
        return self.earthquake.src
    }
    var magLabel: Double {
        return self.earthquake.magnitude
    }
    var depthLabel: Double {
        return self.earthquake.depth
    }
    var latLabel: Double {
        return self.earthquake.lat
    }
    var lngLabel: Double {
        return self.earthquake.lng
    }
}
