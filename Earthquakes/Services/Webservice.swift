//
//  Webservice.swift
//  Earthquakes
//
//  Created by Richard Kelly on 02/08/2020.
//  Copyright © 2020 Richard Kelly. All rights reserved.
//

import Foundation
class Webservice {
    
    func getEarthquakes(url: URL, completion: @escaping ([Earthquake]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let earthquakeList = try? JSONDecoder().decode(QuakesList.self, from: data)
                
                if let earthquakeList = earthquakeList {
                    completion(earthquakeList.earthquakes)
                }
                
                print(earthquakeList?.earthquakes as Any)
                
            }
            
        }.resume()
        
    }
    
}
