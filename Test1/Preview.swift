//
//  ThirdViewController.swift
//  Project1
//
//  Created by apple on 19/08/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit

class Preview: UIViewController {
    
    
    @IBOutlet weak var serviceNo: UILabel!
    
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var from: UILabel!
    
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var seatNumber: UILabel!
    @IBOutlet weak var dateOfJourney: UILabel!
    
    var myFrom:String?
    var myTo:String?
    var myDateOfJourney:String?
    var myServiceNo:String?
    var mySeatNo:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(myFrom!)
        serviceNo.text=myServiceNo
        from.text=myFrom
        to.text=myTo
        
        dateOfJourney.text=myDateOfJourney
        seatNumber.text=mySeatNo
        cost.text="800"
        
        // Do any additional setup after loading the view.
    }
    
    
  
    
}
