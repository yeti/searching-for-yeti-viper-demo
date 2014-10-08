//
//  MapPresenterInterface.swift
//  SearchingForYet
//
//  Created by John Kohler on 10/6/14.
//  Copyright (c) 2014 Yeti. All rights reserved.
//

import Foundation
import MapKit

protocol MapPresenterInterface{
  var interactor : MapInteractor? {get}
  var wireFrame : MapWireFrame? {get}
  var userInterface : MapViewController? {get}
  
  func updateView()
  
  func getMapRegionFromLocations(locations : Array<LocationModel>) -> MKCoordinateRegion

}
