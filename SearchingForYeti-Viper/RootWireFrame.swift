//
//  RootWireFrame.swift
//  SearchingForYet
//
//  Created by John Kohler on 10/6/14.
//  Copyright (c) 2014 Yeti. All rights reserved.
//

import UIKit
let MapIndex = 1
let TravelIndex = 0

class RootWireFrame: NSObject, UITabBarDelegate {
  
  func addViewControllerToTabBarController(viewController: UIViewController, inWindow:UIWindow){
    let tabBarController = tabBarControllerFromWindow(inWindow)
    var viewControllers = tabBarController.viewControllers
    if viewControllers == nil{
      viewControllers = []
    }
    viewControllers?.append(viewController)
    tabBarController.viewControllers = viewControllers
  }
  
  func tabBarControllerFromWindow(window: UIWindow) -> UITabBarController{
    let tabBarController = window.rootViewController as UITabBarController
    return tabBarController;
  }
  
  
  
  
  
   
}
