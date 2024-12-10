//
//  requestToBookViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 10/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class requestToBookViewController: UIViewController {

    @IBOutlet weak var Demail_lbl: UILabel!
    @IBOutlet weak var writeBtn: UIButton!
    @IBOutlet weak var nameDriver: UILabel!
    @IBOutlet weak var driverImage: UIImageView!
    @IBOutlet weak var tyres_lbl: UILabel!
    @IBOutlet weak var snowBoard_lbl: UILabel!
    @IBOutlet weak var pets_lbl: UILabel!
    @IBOutlet weak var bikes_lbl: UILabel!
    @IBOutlet weak var luggage_lbl: UILabel!
    @IBOutlet weak var people_lbl: UILabel!
    @IBOutlet weak var message_lbl: UILabel!
    @IBOutlet weak var price_lbl: UILabel!
    @IBOutlet weak var booking_Lbl: UILabel!
    @IBOutlet weak var approved_lbl: UILabel!
    @IBOutlet weak var leaving_lbl: UILabel!
    @IBOutlet weak var destination_lbl: UILabel!
    @IBOutlet weak var orgin_lbl: UILabel!
    @IBOutlet weak var cancelRide: UISwitch!
    @IBOutlet weak var rideStatus_lbl: UILabel!
    @IBOutlet weak var scroll_view: UIScrollView!
    
    
    var request_id = String()
    var rideDetails_Dict = NSDictionary()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll_view.ShadowColorView()
        driverImage.imageCircle()
//        getTripDetails()
    }
    func otherCheckDeials(others:String)  {
        
        switch others {
        case "0":
            pets_lbl.attributedText = "Pets".strikeThrough()
            bikes_lbl.attributedText = "Bikes".strikeThrough()
            snowBoard_lbl.attributedText = "Snow Boards".strikeThrough()
            tyres_lbl.text = "Tyres"
        case "1":
            pets_lbl.attributedText = "Pets".strikeThrough()
            bikes_lbl.text = "Bikes"
            snowBoard_lbl.attributedText = "Snow Boards".strikeThrough()
            tyres_lbl.attributedText = "Tyres".strikeThrough()
        case "2":
            pets_lbl.attributedText = "Pets".strikeThrough()
            bikes_lbl.attributedText = "Bikes".strikeThrough()
            snowBoard_lbl.text = "Snow Boards"
            tyres_lbl.attributedText = "Tyres".strikeThrough()
        case "3":
            pets_lbl.text = "Pets"
            bikes_lbl.attributedText = "Bikes".strikeThrough()
            snowBoard_lbl.attributedText = "Snow Boards".strikeThrough()
            tyres_lbl.attributedText = "Tyres".strikeThrough()
        default:
            pets_lbl.text = "Pets"
            bikes_lbl.text = "Bikes"
            snowBoard_lbl.text = "Snow Boards"
            tyres_lbl.text = "Tyres"
        }
        
    }
    
    func populateData(dict:NSDictionary)  {
        
        print(dict)
        
        self.orgin_lbl.text = dict["origin"] as? String ?? ""
        self.destination_lbl.text = dict["destination"] as? String ?? ""
        cancelRide.isOn = false
        let available_seats = dict["available_seats"] as? String ?? ""
        let luggage = dict["luggage"] as? String ?? ""
        let back_row_seating = dict["back_row_seating"] as? String ?? ""
        let others_Str = dict["others"] as? String ?? ""
        self.booking_Lbl.text = "Bookings: \(available_seats) "
        let price_per_seat = dict["price_per_seat"] as? String ?? ""
        self.price_lbl.text = "$: \(price_per_seat) per seat"
        self.message_lbl.text = dict["description"] as? String ?? ""
        self.luggage_lbl.text = getLogguage(value:luggage )
        self.people_lbl.text = getBackSeatNumber(value:back_row_seating)
        self.otherCheckDeials(others: others_Str)
        let leaving = dict["leaving"] as? String ?? ""
        leaving_lbl.text = "Leaving at: \(leaving)"
        let driver_image = dict["driver_image_url"] as? String ?? ""
         driverImage.sd_setImage(with: URL(string: driver_image), placeholderImage: UIImage(named: "userAvatar"), options: .refreshCached, context: nil)
        
        let driverFName = dict["driverFirst"] as? String ?? ""
         let Lname = dict["driverLast"] as? String ?? ""
        
        nameDriver.text = driverFName + Lname
        
        let approvedHour = dict["approve_within"] as? String ?? ""
        
        approved_lbl.text = "Approved within: \(approvedHour)"
        
        let Status = dict["status"] as? String ?? ""
        
        rideStatus_lbl.text = "Ride: \(getRideStatus(status: Status))"
        
        cancelRide.isHidden = true
        writeBtn.isHidden = true
        
        if Status == "0" || Status == "1" {
            
            cancelRide.isHidden = false
        }
       
        if Status == "3" {
            
            writeBtn.isHidden = false
        }
        
        Demail_lbl.text = dict["driverEmail"] as? String ?? ""
        
    }
    
//    func getTripDetails()  {
//        
//        let param = ["token":fethToken(),"request_id":request_id]
//        
//        
//        APIManager().postDatatoServer(passengerRideDetails_Api_Endpoint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            
//            if status == true
//            {
//                let dataDict = result?["data"] as? NSDictionary ?? [:]
//                self.rideDetails_Dict =  dataDict["rideDetail"] as? NSDictionary ?? [:]
//                self.populateData(dict: self.rideDetails_Dict)
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//    }
//    
//    func cancelRideFunc()  {
//        
//        let param = ["token":fethToken(),"requestId":request_id,"status":"5"]
//        
//        
//        APIManager().postDatatoServer(cancelRide_Api_endpoint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            
//            if status == true
//            {
//                alertshow(message: messageStr, title: "Ride Details", view: self, sucess: { (sucess) in
//                    
//                    self.navigationController?.popViewController(animated: true)
//                })
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//    }
    
    
    //MARK:- IBAction
    
    
    
    @IBAction func switchAction(_ sender: Any) {
        
//        cancelRideFunc()
        
    }
    
    @IBAction func writeReviewAction(_ sender: Any) {
        
        let ratingVc = self.storyboard?.instantiateViewController(withIdentifier: "reviewTripViewController") as! reviewTripViewController
        ratingVc.driverDict = self.rideDetails_Dict
        self.present(ratingVc, animated: true, completion: nil)
    }
    
    
    @IBAction func back_btn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

