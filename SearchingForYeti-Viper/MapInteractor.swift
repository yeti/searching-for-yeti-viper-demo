//
//  MapInteractor.swift
//  SearchingForYet
//
//  Created by John Kohler on 10/6/14.
//  Copyright (c) 2014 Yeti. All rights reserved.
//

import UIKit


class MapInteractor: NSObject {
  var presenter : MapPresenter?
  var dataStore: MockDataStore?
  
  
  
  
  func findLocations(){
    presenter?.foundLocations(dataStore!.retrieveAllLocations())
  }
  
  
}
