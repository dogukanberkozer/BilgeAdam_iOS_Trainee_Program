//
//  ViewController.swift
//  12_LocationServices
//
//  Created by Dogukan Berk Ozer on 27.01.2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager : CLLocationManager!

    @IBOutlet weak var lblLong: UILabel!
    @IBOutlet weak var lblLat: UILabel!
    @IBOutlet weak var lblAlert: UILabel!
    
    var firstLocation : CLLocation!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblAlert.isHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
        getCurrentLocation()
    }
    
    func getCurrentLocation()
    {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 1
        
        if(CLLocationManager.locationServicesEnabled())
        {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations[0]
        if(count == 0)
        {
            firstLocation = currentLocation
        }
        lblLong.text = String(Float(currentLocation.coordinate.longitude))
        lblLat.text = String(Float(currentLocation.coordinate.latitude))
        count += 1
//        locationManager.stopUpdatingLocation()
        
        let distance = currentLocation.distance(from: firstLocation)
        if(distance > 64)
        {
            lblAlert.isHidden = false
            lblLat.backgroundColor = .red
            lblLong.backgroundColor = .red
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }

}

