//
//  DetailEarthquakeViewController.swift
//  Earthquakes
//
//  Created by Richard Kelly on 05/08/2020.
//  Copyright © 2020 Richard Kelly. All rights reserved.
//

import UIKit
import MapKit

class DetailEarthquakeViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var latData: UILabel!
    @IBOutlet weak var depthData: UILabel!
    @IBOutlet weak var magData: UILabel!
    @IBOutlet weak var lngData: UILabel!
    @IBOutlet weak var dateTime: UILabel!
    @IBOutlet weak var regionData: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.latData?.text = " "
        self.depthData?.text = " "
        self.dateTime?.text = " "
        self.lngData?.text = " "
        self.regionData?.text = " "
        self.magData?.text = " "

       
    }
    


}
