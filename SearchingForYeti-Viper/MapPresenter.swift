//
//  MapPresenter.swift
//  SearchingForYet
//
//  Created by John Kohler on 10/6/14.
//  Copyright (c) 2014 Yeti. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapPresenter: NSObject, MapPresenterInterface {
  
  var interactor : MapInteractor?
  var wireFrame : MapWireFrame?
  var userInterface : MapViewController?
  
  func updateView(){
    self.interactor?.findLocations()
  }
  
  func foundLocations(locations : Array<LocationModel>){
    userInterface?.displayAnnotations(locations)
  }
  
  func getMapRegionFromLocations(locations : Array<LocationModel>) -> MKCoordinateRegion{
    let firstLoc = locations[0]
    let region = MKCoordinateRegionMake(firstLoc.coordinate, MKCoordinateSpanMake(60, 60))
    return region
  }

  
  
  
  
   
}
