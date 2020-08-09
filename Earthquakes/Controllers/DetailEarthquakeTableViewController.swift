//
//  DetailEarthquakeTableViewController.swift
//  Earthquakes
//
//  Created by Richard Kelly on 07/08/2020.
//  Copyright © 2020 Richard Kelly. All rights reserved.
//

import UIKit
import MapKit




class DetailEarthquakeTableViewController: UITableViewController {
    
    
    @IBOutlet weak var datetime: UITextField!
    @IBOutlet weak var regionText: UITextField!
    
    @IBOutlet weak var depthText: UITextField!
    @IBOutlet weak var lngText: UITextField!
    @IBOutlet weak var latText: UITextField!
    @IBOutlet weak var magText: UITextField!
    
    var dataDateTime: String?
    var dataRegionTag: String?
    var dataDepthTag: String?
    var dataMagTag: String?
    var dataLatTag: String?
    var dataLngTag: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateString = dataDateTime
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let newDate = dateFormatter.date(from: dateString!)!
        dateFormatter.dateFormat = "MMM dd, YYYY   HH:mm"
        let convertedDate = dateFormatter.string(from: newDate)
        
        self.datetime.text = convertedDate
        self.regionText?.text = dataRegionTag
        self.depthText?.text = String(describing: dataDepthTag!)
        self.magText?.text = String(describing: dataMagTag!)
        self.latText?.text = String(describing: dataLatTag!)
        self.lngText?.text = String(describing: dataLngTag!)

    }
    
    
    
    
    
}
