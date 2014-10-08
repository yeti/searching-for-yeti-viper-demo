//
//  LocationModel.swift
//  SearchingForYet
//
//  Created by John Kohler on 10/6/14.
//  Copyright (c) 2014 Yeti. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import AddressBook

class LocationModel: NSObject, MKAnnotation {
  var city: String
  var country: String
  var found: Bool
  var coordinate: CLLocationCoordinate2D
  
  
  init(city: String, country :String, found :Bool=false) {
    self.city = city
    self.country = country
    self.found = found
    self.coordinate = CLLocationCoordinate2DMake(0, 0) // will be updated through geocodeing
  }
  /**
  Set the new Coordinates
  */
  func updateCoordinates(){
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString("\(city), \(country)", completionHandler: { (response, error) -> Void in
      let placemarks:Array<CLPlacemark> = response as Array<CLPlacemark>
      let placemark = placemarks[0]
      let location = placemark.location
      let coordinate = location.coordinate
      
      self.coordinate = coordinate
      
    })
  }

  func mapItem() -> MKMapItem{
    let cityKeyString:String = kABPersonAddressCityKey as NSString
    let countryKeyString:String = kABPersonAddressCountryKey as NSString
    let addr_dict = [cityKeyString : self.city, countryKeyString : self.country]
    let placemakr = MKPlacemark(coordinate: self.coordinate, addressDictionary: addr_dict)
    
    let mapItem = MKMapItem(placemark: placemakr)
    mapItem.name = "\(city), \(country)"
    
    return mapItem
  }
  

   
}
