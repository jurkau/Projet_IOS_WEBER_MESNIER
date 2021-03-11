//
//  AddEditNoteTableViewController.swift
//  Projet_IOS_WEBER_MESNIER
//
//  Created by user193287 on 3/11/21.
//

import UIKit
import MapKit
import CoreLocation

class AddEditNoteTableViewController: UITableViewController, CLLocationManagerDelegate {
    
    var note: Note?
    var location: CLLocation?
    
    @IBOutlet weak var titreTF: UITextField!
    @IBOutlet weak var contenuTF: UITextView!
    @IBOutlet var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let note = note {
            titreTF.text = note.titre
            contenuTF.text = note.contenu

            if let location = note.localisation {
                self.location = location
            }
        }
        if let location = self.location {
            renderMap(location: location)
        }
        else {
            // New note, use default coordinates (Paris)
            let defaultCoordinate = CLLocation(latitude: 48.864716, longitude: 2.349014)
            self.location = defaultCoordinate
            renderMap(location: defaultCoordinate)
        }
        
    }
    
    // Render the map on the given location with a pin
    func renderMap(location: CLLocation){
        // First we set the map region:
        // Center of the map
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                longitude: location.coordinate.longitude)
        // Zoom level
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: false)
        
        // Then the exact pin
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
    
    // Called when the 'update location' button is pushed, start updating location
    @IBAction func updateLocation(_ sender: Any) {
        // Set up location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //Request permission
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
    }
    
    // Get the current location, update the note and render the map
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            // We got one location we don't need more
            locationManager.stopUpdatingLocation()
            if let note = note {
                note.localisation = location
            }
            self.location = location
            renderMap(location: location)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveNote" {
            let titre = titreTF.text ?? ""
            let contenu = contenuTF.text ?? ""
            
            note = Note(titre: titre, contenu: contenu, date: Date(), localisation: self.location)
        }
    }
    

}
