//
//  MapViewController.swift
//  SearchingForYet
//
//  Created by John Kohler on 10/6/14.
//  Copyright (c) 2014 Yeti. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
  
  var theMap : MKMapView?
  var presenter : MapPresenterInterface?
  var annotations : Array<LocationModel>?
  

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
      
        // Do any additional setup after loading the view.
    }
    override func viewWillLayoutSubviews() {
      
    }
    func configureView(){
      theMap = MKMapView(frame: CGRectMake(0, 64, 400, 542))
      self.view.addSubview(theMap!);
      theMap!.delegate = self

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    override func viewWillAppear(animated: Bool) {
      self.presenter?.updateView()
      theMap!.region = presenter!.getMapRegionFromLocations(annotations!)
      
    }
  func displayAnnotations(annotations: Array<LocationModel>){
    self.annotations = annotations
      for annotation in self.annotations!{
        theMap!.addAnnotation(annotation)
      }
  }
  func getTabBarItem() -> UITabBarItem{
    return UITabBarItem(tabBarSystemItem: UITabBarSystemItem.History, tag: 3);
  }
  
  
  //------ Map view Delegates

}
