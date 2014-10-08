//
//  MapPresenterSingle.swift
//  SearchingForYet
//
//  Created by John Kohler on 10/6/14.
//  Copyright (c) 2014 Yeti. All rights reserved.
//

import UIKit
import MapKit
class MapPresenterSingle: NSObject, MapPresenterInterface {
  var interactor : MapInteractor?
  var wireFrame : MapWireFrame?
  var userInterface : MapViewController?
  var location : LocationModel
  
  init(location: LocationModel) {
    self.location = location
  }
  
  func updateView(){
    userInterface?.displayAnnotations([location])
  }
  func getMapRegionFromLocations(locations : Array<LocationModel>) -> MKCoordinateRegion{
    let firstLoc = locations[0]
    let region = MKCoordinateRegionMake(firstLoc.coordinate, MKCoordinateSpanMake(30, 30))
    return region
  }
}
