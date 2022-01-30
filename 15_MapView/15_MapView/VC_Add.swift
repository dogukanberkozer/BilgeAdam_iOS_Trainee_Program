//
//  VC_Add.swift
//  15_MapView
//
//  Created by Dogukan Berk Ozer on 30.01.2022.
//

import UIKit
import MapKit

class VC_Add: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIGestureRecognizerDelegate {

    @IBOutlet weak var mvMap: MKMapView!
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var pvPicker: UIPickerView!
    
    var choosedLocation : CLLocationCoordinate2D!
    var annotation = MKPointAnnotation()
    var pinAnnotation = MKPinAnnotationView()
    let source = ["School", "Post", "Mosque"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pvPicker.delegate = self
        pvPicker.dataSource = self
        
        let lpgr = UILongPressGestureRecognizer(target: self, action:#selector(self.handleLongPress))
        lpgr.minimumPressDuration = 1
        lpgr.delaysTouchesBegan = true
        lpgr.delegate = self
        self.mvMap.addGestureRecognizer(lpgr)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return source.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return source[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        annotation.subtitle = source[row]
    }
    
    @objc func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
            if gestureRecognizer.state != UIGestureRecognizer.State.ended {
                return
            }
            else if gestureRecognizer.state != UIGestureRecognizer.State.began {
                let touchPoint = gestureRecognizer.location(in: self.mvMap)

                let touchMapCoordinate =  self.mvMap.convert(touchPoint, toCoordinateFrom: mvMap)
                annotation.coordinate = touchMapCoordinate
                annotation.title = tfTitle.text
                self.mvMap.addAnnotation(annotation)
            }
        }
    
    @IBAction func btnSave_TUI(_ sender: Any) {
        pinAnnotation.annotation = annotation
        if(annotation.subtitle == "School")
        {
            pinAnnotation.image = UIImage(named: "School")
        }
        else if(annotation.subtitle == "Post")
        {
            pinAnnotation.image = UIImage(named: "Post")
        }
        else
        {
            pinAnnotation.image = UIImage(named: "Mosque")
        }
        ViewController.pinAnnotationList.append(pinAnnotation)
        navigationController?.popViewController(animated: true)
    }
}
