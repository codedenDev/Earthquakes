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
    private let locationManager = CLLocationManager()
    
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
            self.magText?.text = String(describing: dataMagTag ?? 0.0)
        }else {
            self.magText?.text = String(describing: dataMagTag ?? 0.0)
        }
        self.datetime.text = convertedDate
        self.regionText?.text = dataRegionTag
        self.depthText?.text = String(describing: dataDepthTag ?? 0.0)
        self.latText?.text = String(describing: dataLatTag ?? 0.0)
        self.lngText?.text = String(describing: dataLngTag ?? 0.0)
        
        self.mapView.delegate = self
       

        self.mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
        
       addPointOfInterest()
    }

    private func addPointOfInterest() {
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: dataLatTag!, longitude: dataLngTag!)
        self.mapView.addAnnotation(annotation)
        let region = CLCircularRegion(center: annotation.coordinate, radius: 200, identifier: "Seismic Activity")
        region.notifyOnEntry = true
        region.notifyOnExit = true
        self.mapView.addOverlay(MKCircle(center: annotation.coordinate, radius: 200))
        self.locationManager.startMonitoring(for: region)
    }
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("didEnterRegion")
    }
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("didExitRegion")
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKCircle {
            let circleRenderer = MKCircleRenderer(circle: overlay as! MKCircle)
            circleRenderer.lineWidth = 1.0
            circleRenderer.strokeColor = UIColor.purple
            circleRenderer.fillColor = UIColor.purple
            circleRenderer.alpha = 0.4
            return circleRenderer
        }
        return MKOverlayRenderer()
    }
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
        mapView.setRegion(region, animated: true)
    }
}
