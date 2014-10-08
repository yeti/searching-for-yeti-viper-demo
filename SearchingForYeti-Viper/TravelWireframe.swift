//
//  TravelWireframe.swift
//  SearchingForYet
//
//  Created by John Kohler on 10/6/14.
//  Copyright (c) 2014 Yeti. All rights reserved.
//

import UIKit

let TravelNavControllerId = "TravelNavController"
let AddEntryControllerID = "AddEntryView"

class TravelWireframe: NSObject {
  var rootWireFrame : RootWireFrame?
  var travelPresenter : TravelPresenter?
  var travelViewController : TravelViewController?
  var mapWireFrame : MapWireFrame?
  
  var navController : UINavigationController?
  
  func presentTravelFromWindow(window: UIWindow){
    let navController = navControllerFromStoryboard()
    let viewController = travelViewControllerFromNavigationController(navController)
    
    viewController.presenter = travelPresenter
    travelViewController = viewController
    travelPresenter?.viewController = viewController
    rootWireFrame?.addViewControllerToTabBarController(navController, inWindow: window)
  }
  
  
  func travelStoryboard() -> UIStoryboard{
    let storyboard = UIStoryboard(name: "Travel", bundle: NSBundle.mainBundle())
    return storyboard
  }
  
  func navControllerFromStoryboard() -> UINavigationController{
    if self.navController == nil{
      let storyboard = travelStoryboard()
      let viewController = storyboard.instantiateViewControllerWithIdentifier(TravelNavControllerId) as UINavigationController
      self.navController = viewController
    }
    return self.navController!
  }
  
  func travelViewControllerFromNavigationController(navController: UINavigationController) -> TravelViewController{
    let viewController = navController.topViewController as TravelViewController
    return viewController
  }
  
  func pushToMapWithLocation(location: LocationModel){
    let navController = navControllerFromStoryboard()
    mapWireFrame?.pushMapFromNavigationViewController(self.navController!, location: location)
  }
  
  
  func pushAddViewController(){
    let storyboard = travelStoryboard()
    let newVC = storyboard.instantiateViewControllerWithIdentifier(AddEntryControllerID) as AddViewController
    newVC.presenter = self.travelPresenter
    travelPresenter?.addController = newVC
    navController?.pushViewController(newVC, animated: true)
  }
  func popViewController(){
    let nav = navControllerFromStoryboard()
    nav.popViewControllerAnimated(true)
  }
}

