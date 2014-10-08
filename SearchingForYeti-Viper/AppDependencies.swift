//
//  AppDependencies.swift
//  SearchingForYet
//
//  Created by John Kohler on 10/6/14.
//  Copyright (c) 2014 Yeti. All rights reserved.
//

import UIKit

class AppDependencies {
  
  var travelWireFrame = TravelWireframe()
  var mapWireFrame = MapWireFrame()
  
  
  init() {
    configureDependencies()
  }
  
  
  func installTabbedViewControllersIntoWindow(window: UIWindow){
    travelWireFrame.presentTravelFromWindow(window)
    mapWireFrame.presentMapInterfaceFromWindow(window)
    
  }
 
  func configureDependencies(){
    // set up relations to all wireframes
    //Root Wireframe
    let rootWire = RootWireFrame()
    let globalDataStore = MockDataStore()
    
    //// Travel Module
    //---------
    
    let travelPresenter = TravelPresenter()
    let travelInteractor = TravelInteractor()
    travelInteractor.presenter = travelPresenter
    travelInteractor.dataStore = globalDataStore;
    travelPresenter.interactor = travelInteractor
    travelPresenter.wireframe = travelWireFrame
    
    //wireframe
    travelWireFrame.travelPresenter = travelPresenter
    travelWireFrame.rootWireFrame = rootWire
    
    
    //// Map Module
    //---------
    let mapPresenter = MapPresenter()
    let mapInteractor = MapInteractor()
    mapInteractor.dataStore = globalDataStore
    mapInteractor.presenter = mapPresenter
    mapPresenter.interactor = mapInteractor
    mapPresenter.wireFrame = mapWireFrame
    
    //wire frame
    mapWireFrame.presenter = mapPresenter
    mapWireFrame.rootWireFrame = rootWire
    travelWireFrame.mapWireFrame = mapWireFrame
    
    
  }

}








