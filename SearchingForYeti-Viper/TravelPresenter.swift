//
//  TravelPresenter.swift
//  SearchingForYet
//
//  Created by John Kohler on 10/6/14.
//  Copyright (c) 2014 Yeti. All rights reserved.
//

import UIKit

let kShowAddVCIdentifier = "showAddVC"

class TravelPresenter: NSObject {
  
  var wireframe : TravelWireframe?
  var viewController : TravelViewController?
  var addController :  AddViewController?
  var interactor : TravelInteractor?
  
  var checkedPaths = NSMutableSet()
  
  //MARK: - Travel View Functions
  func updateView(){
    interactor?.findLocations()
  }
  
  func foundLocations(locations: Array<LocationModel>){
    if locations.count == 0{
      viewController?.showNoContentView()
    }else{
      viewController?.updateWithLocations(locations)
    }
  }
  
  func locationWasSelected(location: LocationModel, selectedCell : UITableViewCell){
   alertFromLocation(location)
   locationChecks(location, selectedCell: selectedCell)

  }
  func locationChecks(location : LocationModel, selectedCell :UITableViewCell){
    if checkedPaths.containsObject(location){
      viewController?.uncheck(selectedCell)
      checkedPaths.removeObject(location)
    }else{
      viewController?.check(selectedCell)
      checkedPaths.addObject(location)
    }
  }
  
  func getAccessoryTypeWithLocation(location:LocationModel) -> UITableViewCellAccessoryType{
    if checkedPaths.containsObject(location){
      return .Checkmark
    }
    return .None
  }
  
  func pushMap(location: LocationModel){
    self.wireframe?.pushToMapWithLocation(location)
  }
  func alertFromLocation(location:LocationModel){
    let alertController = UIAlertController(title: location.city, message: "Lat: \(location.coordinate.latitude)\n Long: \(location.coordinate.longitude)", preferredStyle: .Alert)
    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
      
    }
    let mapAction = UIAlertAction(title: "Map", style: UIAlertActionStyle.Default) { (action) -> Void in
      self.pushMap(location)
    }
    alertController.addAction(cancelAction)
    alertController.addAction(mapAction)
    self.viewController?.showAlert(alertController)
  }
  
  func sightedText(location: LocationModel) -> String{
    if !location.found{
     return "No Sightings"
    }
    return "Sighted"
  }

  func addBtnHit(){
    wireframe?.pushAddViewController()
  }
  
  //MARK: - AddView Functions
  func addNewLocation(city: String, country:String, found :Bool){
    if validateLocation(city, state: country){
      wireframe?.popViewController()
      interactor?.addNewLocationWith(city, country: country, found: found)
      
    }else{
      let alertController = UIAlertController(title: "Error", message: "Make sure all fields are filled in", preferredStyle: .Alert);
      let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
      alertController.addAction(cancelAction)
      self.addController!.showAlert(alertController)
    }
  }
  func validateLocation(city: String, state: String) -> Bool{
    return city != "" && state != ""
  }
  
   
}




