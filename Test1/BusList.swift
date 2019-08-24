//
//  SecondViewController.swift
//  Project1
//
//  Created by apple on 18/08/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BusList: UIViewController, UITextFieldDelegate , UITableViewDelegate, UITableViewDataSource {
    
    //@IBOutlet weak var btn: UIButton!
    //@IBOutlet weak var bookbtn: UIButton!
    // @IBOutlet weak var tableLabel: UILabel!
    // @IBOutlet weak var myLabel: UILabel!
    var fromPlace:String=""
    var to:String=""
    var dateOfJournery:String=""
    var servcNo:String=""
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.arrRes.count)
        //print(from!)
        return self.arrRes.count
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationItem.title=nil
        if segue.identifier=="mySegue2"{
            print("heelo")
            let s=segue.destination as! Preview
            //s.fromPlace=self.from
            //print("from in second \(s.from)")
            //s.to=self.to
            //s.dateOfJournery=self.dateOfJourney
            // s.myFrom=self.fromPlace
            s.myFrom=self.fromPlace
            s.myTo=self.to
            s.mydateOfJourney=self.dateOfJournery
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //s.test="test"
        
        self.performSegue(withIdentifier:"mySegue2", sender: self)
        // navigationController?.pushViewController(NewController(), animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "jsonCell", for: indexPath)
        
        var dict = arrRes[indexPath.row]
        cell.textLabel?.text = "\(dict["fromPlace"]!) -To-\(dict["toPlace"]!)" as? String
        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    var arrRes = [[String : AnyObject]]()
    
    //var e=(String).self.from!
    //print(type(of:from))
    //  let findAllString = "http://localhost:9002/employees?name=\(self.e)"
    //Array of dictionary
    override func viewDidLoad() {
        super.viewDidLoad()
        let findAllString = "http://localhost:8080/BusDetails?dateOfJourney=\(dateOfJournery)&from=\(fromPlace)&to=\(to)"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "jsonCell")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // Do any additional setup after loading the view.
        // firstName.delegate = self
        //firstName.becomeFirstResponder()
        //lastName.delegate = self
        //number.delegate = self
        loadData(urlToFetch : findAllString)
        
        self.tableView.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     self.navigationItem.title=nil
     if segue.identifier=="mySegue2"{
     print("heelo")
     let s=segue.destination as! ThirdViewController
     // s.fromPlace=self.from
     //print("from in second \(s.from)")
     s.test="test"
     //s.dateOfJournery=self.dateOfJourney
     
     }
     }*/
    
    func loadData(urlToFetch : String){
        print(urlToFetch)
        
        AF.request(urlToFetch).responseJSON { (responseData) -> Void in
            print(responseData)
            // print(type(of: self.from))
            let swiftJsonVar = JSON(responseData.data as Any)
            print(swiftJsonVar)
            if let resData = swiftJsonVar["list"].arrayObject{
                self.arrRes = resData as! [[String:AnyObject]]
            }
            
            if(self.arrRes.count>0){
                print("my data number is\(self.arrRes.count)")
                self.tableView.reloadData()
            }
            
        }
        
        //print(arrRes)
        
        self.tableView.reloadData()
        
    }
    
    
    
}
