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
    var mydateOfJourney:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(myFrom!)
        serviceNo.text="1806"
        from.text=myFrom
        to.text=myTo
        dateOfJourney.text=mydateOfJourney
        seatNumber.text="12"
        cost.text="800"
        
        // Do any additional setup after loading the view.
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
