//
//  reviewTripViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 10/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit
import BottomPopup
import HCSStarRatingView
class reviewTripViewController: BottomPopupViewController {

    @IBOutlet weak var deedback: UITextView!
    @IBOutlet weak var ratingView: UIView!
    
    
    var driverDict = NSDictionary()
    var ratingValueStr = "1"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(driverDict)
        RatingStar()
       
    }
     func getPopupHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height - 75
    }
    
    func RatingStar()  {
        
        let ratingLabal = HCSStarRatingView()
        ratingLabal.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        ratingLabal.maximumValue = 5
        ratingLabal.minimumValue = 1
        ratingLabal.allowsHalfStars = false
        ratingLabal.value = 1
        ratingLabal.spacing = 10
        ratingLabal.filledStarImage = UIImage(named:"filledstar")
        ratingLabal.emptyStarImage = UIImage(named:"empty_star")
        ratingLabal.addTarget(self, action: #selector(ratingValue), for: .valueChanged)
        ratingView.addSubview(ratingLabal)
    }
    
//    func submitReview()  {
//        
//        let driver_id = driverDict["driver_id"] as? String ?? ""
//        let passenger_id = driverDict["passenger_id"] as? String ?? ""
//        let posted_trip_id = driverDict["posted_trip_id"] as? String ?? ""
//         let posted_trip_stops_id = driverDict["posted_trip_stops_id"] as? String ?? ""
//        let request_id = driverDict["request_id"] as? String ?? ""
//        
//        
//        
//        let param = ["token":fethToken(),"request_id":request_id,"rating":ratingValueStr,"posted_trip_id":posted_trip_id,"posted_trip_stops_id":posted_trip_stops_id,"requested_trip_id":request_id,"driver_id":driver_id,"passenger_id":passenger_id,"review_by":"0","comment":deedback.text!]
//        
//        
//        print(param)
//        
//        APIManager().postDatatoServer(reviewApi_endpoint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            
//            if status == true
//            {
//                self.dismiss(animated: true, completion: nil)
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            
//            
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//        
//
//    }
//    
    
    
    
    //MARK:- IBAction
    
    @objc func ratingValue(sender:HCSStarRatingView)  {
        
        let vlue = Int(sender.value)
        
        ratingValueStr = "\(vlue)"
    }

    @IBAction func submit(_ sender: Any) {
        
//        submitReview()
    }
    
    @IBAction func cancelTap(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
