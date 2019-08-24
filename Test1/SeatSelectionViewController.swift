//
//  SeatSelectionViewController.swift
//  Test1
//
//  Created by Apple on 8/24/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit

class SeatSelectionViewController: UIViewController , ZSeatSelectorDelegate {
    
    var myFrom:String?
    var myTo:String?
    var myDateOfJourney:String?
    var myServiceNo:String?
    var mySeat:String?
    
    
    @IBAction func next(_ sender: Any) {
       
       
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let map2:String =   "DD___DD/" +
            
            
            "AA___DU/" +
            
            "AA___UA/" +
            
            "UA___AA/" +
            
            "AA___UU/" +
            
            "AA___AA/" +
            
        "AAUAUAA/"
        
        let seats = ZSeatSelector()
        seats.frame = CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: 500)
        seats.setSeatSize(CGSize(width: 40, height: 40))
        seats.setAvailableImage(   UIImage(named: "A")!,
                                    andUnavailableImage:    UIImage(named: "U")!,
                                    andDisabledImage:       UIImage(named: "D")!,
                                    andSelectedImage:       UIImage(named: "S")!)
        seats.layout_type = "Normal"
        seats.setMap(map2)
        seats.seat_price           = 5.0
        seats.selected_seat_limit  = 2
        seats.seatSelectorDelegate = self
        seats.maximumZoomScale         = 5.0
        seats.minimumZoomScale         = 0.05
        self.view.addSubview(seats)
        
        
    }
    
    func seatSelected(_ seat: ZSeat) {
        //print("Seat at row: \(seat.row) and column: \(seat.column)\n")
    }
    
    func getSelectedSeats(_ seats: NSMutableArray) {
        var total:Float = 0.0;
        mySeat=""
        for i in 0..<seats.count {
            let seat:ZSeat  = seats.object(at: i) as! ZSeat
            print("Seat at row: \(seat.row) and column: \(seat.column)\n")
            total += seat.price
            if(mySeat=="")
            {
                mySeat=String(seat.row) + String(seat.column)
            }
            else
            {
                mySeat = mySeat! + ", " + String(seat.row) + String(seat.column)
            }
            print(mySeat!)
        }
        print("----- Total -----\n")
        print("----- \(total) -----\n")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationItem.title=nil
        print("hi")
        if segue.identifier=="seatseltopreview"{
            print("heelo")
            let s=segue.destination as! Preview
            

            s.myFrom=self.myFrom
            s.myTo=self.myTo
            s.myDateOfJourney=self.myDateOfJourney
            s.myServiceNo=self.myServiceNo
            s.mySeatNo = self.mySeat

        }
    }
    
    
}
