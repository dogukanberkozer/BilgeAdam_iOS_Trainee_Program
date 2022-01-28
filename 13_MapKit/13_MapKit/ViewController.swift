//
//  ViewController.swift
//  13_MapKit
//
//  Created by Dogukan Berk Ozer on 28.01.2022.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mkMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAdd_TUI(_ sender: Any) {
        
        let c = CLLocationCoordinate2D(latitude: 36.974074, longitude: 30.9134179)
        let myLoc = CLLocation(latitude: c.latitude, longitude: c.longitude)
        let an = MKPointAnnotation()
        an.title = "Antalya"
        an.subtitle = "im here!"
        an.coordinate = c
        mkMap.addAnnotation(an)
        
        var tempC = CLLocationCoordinate2D()
        
        for i in 1...100
        {
            tempC = CLLocationCoordinate2D()
            let tempAn = MKPointAnnotation()
            tempC = CLLocationCoordinate2D(latitude: CLLocationDegrees(randomBetweenNumbers(firstNum: 35.9025, secondNum: 42.02683)), longitude: CLLocationDegrees(randomBetweenNumbers(firstNum: 25.90902, secondNum: 44.5742)))
            tempAn.title = "\(i)"
            tempAn.coordinate = tempC
            
            let loc = CLLocation(latitude: tempC.latitude, longitude: tempC.longitude)
            let distance = myLoc.distance(from: loc)
            
            if(distance < 100000)
            {
                mkMap.addAnnotation(tempAn)
            }
        }
    }
    
    func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}

