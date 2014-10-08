//
//  CoreDataStore.swift
//  SearchingForYet
//
//  Created by John Kohler on 10/7/14.
//  Copyright (c) 2014 Yeti. All rights reserved.
//

import UIKit
import CoreData

class MockDataStore: NSObject {
  var savedLocations: Array<LocationModel>
  
  override init(){
    let location1 = LocationModel(city: "San Francisco", country: "United States", found: false)
    let location2 = LocationModel(city: "Moscow", country: "Russia", found: false)
    let location3 = LocationModel(city: "Kathmandu", country: "Nepal", found: true)
    let location4 = LocationModel(city: "Montreal", country: "Canada", found: false)
    let myLocations = [location1,location2,location3,location4]
    for location in myLocations{
      location.updateCoordinates()
    }
    savedLocations = myLocations
  }
  
  func retrieveAllLocations() -> Array<LocationModel>{
    return savedLocations
  }
  func addLocation(location :LocationModel){
    savedLocations.append(location)
  }
}
