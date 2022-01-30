//
//  ViewController.swift
//  15_MapView
//
//  Created by Dogukan Berk Ozer on 30.01.2022.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mvMap: MKMapView!
    @IBOutlet weak var scSegment: UISegmentedControl!
    
    static var pinAnnotationList = [MKPinAnnotationView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scSegment.selectedSegmentIndex = 3
        indexCahnged(3)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        indexCahnged(scSegment.selectedSegmentIndex)
    }

    @IBAction func indexCahnged(_ sender: Any) {
        switch scSegment.selectedSegmentIndex
        {
        case 0:
            showAnnotations(type: "School")
        case 1:
            showAnnotations(type: "Post")
        case 2:
            showAnnotations(type: "Mosque")
        case 3:
            showAnnotations()
        default:
            print("ERROR")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sgAdd", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgUpdate")
        {
            _ = segue.destination as! VC_Add
        }
    }
    
    func showAnnotations(type : String) -> Void
    {
        for pinAnnotation in ViewController.pinAnnotationList
        {
            if(pinAnnotation.annotation!.subtitle == type)
            {
                mvMap.addAnnotation(pinAnnotation.annotation!)
            }
            else
            {
                mvMap.removeAnnotation(pinAnnotation.annotation!)
            }
        }
    }
    
    func showAnnotations()
    {
        for pinAnnotation in ViewController.pinAnnotationList
        {
            mvMap.addAnnotation(pinAnnotation.annotation!)
        }
    }
}

