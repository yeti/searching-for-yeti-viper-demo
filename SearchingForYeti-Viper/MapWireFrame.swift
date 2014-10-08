//
//  MapWireFrame.swift
//  SearchingForYet
//
//  Created by John Kohler on 10/6/14.
//  Copyright (c) 2014 Yeti. All rights reserved.
//

import UIKit

let MapNavID = "MapNavControllerID"

class MapWireFrame: NSObject {
  var presenter : MapPresenter?
  var viewController : MapViewController?
  var rootWireFrame : RootWireFrame?
  
  
  
  func presentMapInterfaceFromWindow(window: UIWindow){
    var navController = navigationControllerFromStoryboard()
    let vc = mapViewControllerFromNavigationController(navController)
    vc.presenter = presenter? // set the VC's presenter
    viewController = vc // Set this wireframes viewcontroller
    presenter?.userInterface = vc // set the presenters user interface
    
    rootWireFrame?.addViewControllerToTabBarController(navController, inWindow: window)
    
  }
  
  func navigationControllerFromStoryboard() -> UINavigationController {
    let storyboard = mapStoryboard()
    let viewController = storyboard.instantiateViewControllerWithIdentifier(MapNavID) as UINavigationController
    return viewController
  }
  
  func mapViewControllerFromNavigationController(navigationController: UINavigationController) -> MapViewController {
    let viewController = navigationController.topViewController as MapViewController
    return viewController;
  }
  
  func mapStoryboard() -> UIStoryboard {
    let storyboard = UIStoryboard(name: "YetiMap", bundle: NSBundle.mainBundle())
    return storyboard
  }
  func pushMapFromNavigationViewController(navController: UINavigationController, location: LocationModel){
    let newMapVC = MapViewController()
    let singleMapPresenter = MapPresenterSingle(location: location)
    singleMapPresenter.userInterface = newMapVC
    singleMapPresenter.interactor = MapInteractor()
    newMapVC.presenter = singleMapPresenter
    
    navController.pushViewController(newMapVC, animated: true);
  }
  
}
