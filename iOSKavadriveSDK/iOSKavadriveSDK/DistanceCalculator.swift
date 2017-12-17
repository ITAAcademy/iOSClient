//
//  DistanceCalculator.swift
//  iOSKavadriveSDK
//
//  Created by Nikolas Omelianov on 17.12.17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import CoreLocation

public class DistanceCalculator  {//CLLocationManagerDelegate
    
    var userLocation = Locations()
    var storeExample = DumbStore()
    var listOfClosestStores : [Locations] = []
    let locationManager = CLLocationManager()
    
    //locationManager.delegate = self
    //locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    //locationManager.requestWhenInUseAuthorization()
    //locationMamager.startUpdatingLocation()
    
    //CoreLocation methods begin
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]){
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            
            print(location.coordinate.latitude , location.coordinate.longitude)
            userLocation.longitude = location.coordinate.longitude
            userLocation.latitude = location.coordinate.latitude
            userLocation.name = "MyLocation"
        }
    }
   
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    //CoreLocation methods end
    
    func distance(from source: Locations, to target: Locations) -> Double{
        let distanceX = Double(source.latitude - target.latitude)
        let distanceY = Double(source.longitude - target.longitude)
        
        return sqrt(distanceX * distanceX + distanceY * distanceY)
        
    }
    
    
    
    func sortStoresToList() {
        
        var storeLocations : [Locations] = []
        for i in 0..<10 {//temporary count
            storeLocations.append(Locations(latitude: storeExample.latitude, longitude: storeExample.longitude, name: storeExample.name, distance: 0)) //figuring out how to optimize that part by closure or some other way
            storeLocations[i].distance = Float(distance(from: userLocation, to: storeLocations[i]))
        }
        
        listOfClosestStores = storeLocations.sorted { $0.distance < $1.distance}
    }
    

    
    
}
