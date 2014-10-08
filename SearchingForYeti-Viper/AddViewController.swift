//
//  AddViewController.swift
//  SearchingForYet
//
//  Created by John Kohler on 10/7/14.
//  Copyright (c) 2014 Yeti. All rights reserved.
//

import UIKit

class AddViewController: UIViewController{
  var presenter: TravelPresenter?
  
    // UI Outlets
    @IBOutlet weak var countryText: UITextField!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var foundSwitch: UISwitch!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.navigationItem.title = "Add Location"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func showAlert(alertController : UIAlertController){
      self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func createBtnHit(sender: AnyObject) {
      presenter?.addNewLocation(cityText.text, country: countryText.text, found: foundSwitch.on)
    }

}
