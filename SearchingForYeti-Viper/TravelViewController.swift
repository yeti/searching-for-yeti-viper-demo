//
//  TravelViewController.swift
//  SearchingForYet
//
//  Created by John Kohler on 10/6/14.
//  Copyright (c) 2014 Yeti. All rights reserved.
//

import UIKit

class TravelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
  var presenter : TravelPresenter?
  var locations : Array<LocationModel>?
  
  // ui elements
  
    @IBOutlet weak var noContentView: UIView!
    @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Initializations
  override func viewDidLoad() {
      super.viewDidLoad()
      configureView()

      // Do any additional setup after loading the view.
  }
  override func viewWillAppear(animated: Bool) {
    presenter?.updateView()
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  

  func configureView(){
    navigationItem.title = "Visited"
    noContentView.hidden = true
    tableView.hidden = false
    var tabBarItem = self.navigationController?.tabBarItem
    if tabBarItem != nil{
      tabBarItem?.image = UIImage(named: "802-dog-house")
      tabBarItem?.selectedImage = UIImage(named: "802-dog-house-selected")
    }
    // create bar button item - We send the button action directly to the presenter
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: presenter, action: "addBtnHit")
  }
  //MARK: - Display Views
  func showNoContentView(){
    noContentView.hidden = false
    tableView.hidden = true
  }
  
  func updateWithLocations(foundLocations: Array<LocationModel>){
    locations = foundLocations
    noContentView.hidden = true
    tableView.hidden = false
    tableView.reloadData()
    
  }
  
  func check(cell : UITableViewCell){
    cell.accessoryType = .Checkmark
  }
  
  func uncheck(cell: UITableViewCell){
    cell.accessoryType = .None
  }
  
  // Great example of the separation in Viper
  func showAlert(alertController : UIAlertController){
    self.presentViewController(alertController, animated: true, completion: nil)
  }
  
  //MARK: - UITableView Datasource
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    if locations == nil{
      return 0
    }
    return 1;
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return locations!.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("locationCell") as? UITableViewCell;
    if cell == nil{
      cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "locationCell")
    }
    let location = locations?[indexPath.row]
    if location != nil{
    cell!.textLabel?.text = "\(location!.city), \(location!.country)"
    
    cell?.detailTextLabel?.text = presenter?.sightedText(location!)
    cell?.accessoryType = presenter!.getAccessoryTypeWithLocation(location!)
    }
    return cell!
  }
  
  // MARK: - UITableView Delegate
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let loc = locations![indexPath.row]
    self.presenter?.locationWasSelected(loc, selectedCell: tableView.cellForRowAtIndexPath(indexPath)!)
    
  }


}





