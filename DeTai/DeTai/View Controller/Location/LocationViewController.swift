//
//  LocationViewController.swift
//  DeTai
//
//  Created by Long Nguyen on 7/16/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class LocationViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    let searchRadius: CLLocationDistance = 2000
    @IBOutlet weak var mapCurrent: MKMapView!
    var nameOfHospital = [String]()
    var mapSearch = [MKMapItem]()
    @IBOutlet weak var tbvHospital: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = RootTab.locationTab.title
        // Do any additional setup after loading the view.
        tbvHospital.delegate = self
        tbvHospital.dataSource = self
    }

    @IBAction func btnFind(_ sender: Any) {
        print("chinh dep trai")
            self.nameOfHospital.removeAll()
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            mapCurrent.showsUserLocation = true

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var location = locations.last as! CLLocation
        print(location.coordinate.longitude)
        print(location.coordinate.latitude)

        //        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        //        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, searchRadius * 2.0, searchRadius * 2.0)
        let laaa = location.coordinate.longitude
        
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "Bệnh viện"
        // 2
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        request.region = MKCoordinateRegion(center: location.coordinate, span: span)
        // 3
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if (response == nil){
                print("ERROR")
            }
            else{
                for item in (response?.mapItems)! {
                    print("Item name = \(String(describing: item.name))")
                    print("Latitude = \(String(describing: item.placemark.location?.coordinate.latitude))")
                    print("Longitude = \(String(describing: item.placemark.location?.coordinate.longitude))")
                   self.addPinToMapView(title: item.name!, latitude: (item.placemark.location?.coordinate.latitude)!, longitude: (item.placemark.location?.coordinate.longitude)!)
                   // self.mapSearch = [item]
                    let phone = String(format: "%@", item.phoneNumber!)
                    self.mapSearch.append(item)
                    print(phone)
                    let str = String(format: "%@", item.name!)
                    self.nameOfHospital.append(str + "   (" + phone + ")" )
                }
                self.tbvHospital.reloadData()
            }
        }
        
        mapCurrent.setRegion(coordinateRegion, animated: true)
        manager.stopUpdatingLocation()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func addPinToMapView(title: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let annotation = MyAnnotation(title: title, coordinate: location)
        
        mapCurrent.addAnnotation(annotation)
    }
}

extension LocationViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameOfHospital.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MapCell") as! MapCell
        cell.lblName.text = nameOfHospital[indexPath.row]
        var image : UIImage = UIImage(named:"hospital_location-512")!
        cell.imgHospital =  UIImageView(image: image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let options = [MKLaunchOptionsDirectionsModeKey:
            MKLaunchOptionsDirectionsModeDriving,
                       MKLaunchOptionsShowsTrafficKey: true] as [String : Any]
        
        MKMapItem.openMaps(with: [mapSearch[indexPath.row]], launchOptions: options)
        
    }
}

