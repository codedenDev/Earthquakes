//
//  DetailEarthquakeTableViewController.swift
//  Earthquakes
//
//  Created by Richard Kelly on 07/08/2020.
//  Copyright © 2020 Richard Kelly. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation




class DetailEarthquakeTableViewController: UITableViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var datetime: UITextField!
    @IBOutlet weak var regionText: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var depthText: UITextField!
    @IBOutlet weak var lngText: UITextField!
    @IBOutlet weak var latText: UITextField!
    @IBOutlet weak var magText: UITextField!
    
    var dataDateTime: String?
    var dataRegionTag: String?
    var dataDepthTag: Double?
    var dataMagTag: Double?
    var dataLatTag: Double?
    var dataLngTag: Double?
    
    public static var lat: Double = 0.0
    public static var lng: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateString = dataDateTime
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let newDate = dateFormatter.date(from: dateString!)!
        dateFormatter.dateFormat = "MMM dd, YYYY   HH:mm"
        let convertedDate = dateFormatter.string(from: newDate)
        
        if Double(dataMagTag!) > 7.9 {
            magText.textColor = UIColor.Font.alertColor
            self.magText?.text = String(describing: dataMagTag!)
        }else {
            self.magText?.text = String(describing: dataMagTag!)
        }
        
        self.datetime.text = convertedDate
        self.regionText?.text = dataRegionTag
        self.depthText?.text = String(describing: dataDepthTag!)
        self.latText?.text = String(describing: dataLatTag!)
        self.lngText?.text = String(describing: dataLngTag!)
        self.mapView.delegate = self
        DetailEarthquakeTableViewController.lat = dataLatTag!
        DetailEarthquakeTableViewController.lng = dataLngTag!
        
        
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        let quakeCenter = CLLocation(latitude: dataLatTag!, longitude: dataLngTag!)
        let region = MKCoordinateRegion(
            center: quakeCenter.coordinate,
            latitudinalMeters: 1000,
            longitudinalMeters: 1000)
        mapView.setCameraBoundary(
            MKMapView.CameraBoundary(coordinateRegion: region),
            animated: true)
        
        if let coor = mapView.userLocation.location?.coordinate{
            mapView.setCenter(coor, animated: true)
            
        }
        
        
    }
    
    
}
private extension MKMapView {
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
















