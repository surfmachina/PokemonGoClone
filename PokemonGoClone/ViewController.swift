//
//  ViewController.swift
//  PokemonGoClone
//
//  Created by Thomas Carlson on 20/4/19.
//  Copyright © 2019 SurfMachina. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var MapView: MKMapView!
    
    var manager = CLLocationManager()
    var update_count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            print("Ready to go")
            MapView.showsUserLocation = true
            
            manager.startUpdatingLocation()
            
        } else {
            manager.requestWhenInUseAuthorization()
        }
        
        
        
        
        // Do any additional setup after loading the view.
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("We made it")
         let region = MKCoordinateRegion.init(center: manager.location!.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        
        if update_count < 3 {
        MapView.setRegion(region, animated: false)
            update_count += 1
        } else {
            manager.stopUpdatingLocation()
        }
    }
}

