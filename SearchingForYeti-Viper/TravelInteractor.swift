//
//  TravelInteractor.swift
//  SearchingForYet
//
//  Created by John Kohler on 10/6/14.
//  Copyright (c) 2014 Yeti. All rights reserved.
//

import UIKit

class TravelInteractor: NSObject {
  
  var presenter : TravelPresenter?
  var dataStore : MockDataStore?
  

  func findLocations(){
    presenter?.foundLocations(dataStore!.retrieveAllLocations())
  }
  func addNewLocationWith(city :String, country :String, found:Bool){
    var newLoc = LocationModel(city: city, country: country, found: found)
    newLoc.updateCoordinates()
    dataStore?.addLocation(newLoc);
  }
}
