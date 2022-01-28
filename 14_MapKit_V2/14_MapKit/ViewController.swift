//
//  ViewController.swift
//  14_MapKit
//
//  Created by Dogukan Berk Ozer on 28.01.2022.
//

import UIKit
import MapKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var mkMap: MKMapView!
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfDescription: UITextField!
    
    var annotation = MKPointAnnotation()
    var long : Double!
    var lat : Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let lpgr = UILongPressGestureRecognizer(target: self, action:#selector(self.handleLongPress))
        lpgr.minimumPressDuration = 1
        lpgr.delaysTouchesBegan = true
        lpgr.delegate = self
        self.mkMap.addGestureRecognizer(lpgr)
    }
    
    @objc func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state != UIGestureRecognizer.State.ended {
            return
        }
        else if gestureRecognizer.state != UIGestureRecognizer.State.began {
            let touchPoint = gestureRecognizer.location(in: self.mkMap)

            let touchMapCoordinate =  self.mkMap.convert(touchPoint, toCoordinateFrom: mkMap)
            annotation.coordinate = touchMapCoordinate
            annotation.title = ""
            annotation.subtitle = ""
            tfTitle.text = ""
            tfDescription.text = ""
            long = annotation.coordinate.longitude
            lat = annotation.coordinate.latitude
            self.mkMap.addAnnotation(annotation)
        }
    }
    
    @IBAction func btnShow_TUI(_ sender: Any) {
        annotation.title = tfTitle.text
        annotation.subtitle = tfDescription.text

        let ac = UIAlertController(title: "PIN INFO", message: "Title: \(String(describing: annotation.title!))\nSubtitle: \(String(describing: annotation.subtitle!))\nLongitude: \(String(describing: long!))\nLatitude: \(String(describing: lat!))", preferredStyle: UIAlertController.Style.alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in

        }))
        present(ac, animated: true, completion: nil)
    }
}

