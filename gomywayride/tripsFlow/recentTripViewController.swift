//
//  recentTripViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 07/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class recentTripViewController: UIViewController {

    @IBOutlet weak var recenTable: UITableView!
    
    
    var RecentData : RecentTripDataModel!
    var TripArr = [RecentTripDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedRecentTripsNotification(notification:)), name: Notification.Name("NotificationMyTripsRecent"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedRecentRidesNotification(notification:)), name: Notification.Name("NotificationMyRidesRecent"), object: nil)
         recenTable.tableFooterView = UIView(frame: .zero)
    }
    
    @objc func methodOfReceivedRecentTripsNotification(notification: Notification) {
//        RecentTrip()
    }
    
    @objc func methodOfReceivedRecentRidesNotification(notification: Notification) {
//        RecentRide()
    }
    
//    func RecentTrip()  {
//        
//        let param = ["token":fethToken(),"type":"recent"]
//        
//        
//        APIManager().postDatatoServer(recentTripApi_endpoint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            self.TripArr.removeAll()
//            if status == true
//            {
//                let dataArr = result?["data"] as? NSArray ?? []
//                
//                for item in dataArr
//                {
//                    self.RecentData = RecentTripDataModel.init(data: item as! [String : Any])
//                    self.TripArr.append(self.RecentData)
//                }
//                
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            
//            self.recenTable.reloadData()
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//        
//    }
//    
//    func RecentRide() {
//        
//        let param = ["token":fethToken(),"type":"recent"]
//        
//        
//        APIManager().postDatatoServer(passengerRecentAPi_endpoint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            self.TripArr.removeAll()
//            
//            if status == true
//            {
//                
//                let dataArr = result?["data"] as? NSArray ?? []
//                
//                for item in dataArr {
//                    self.RecentData = RecentTripDataModel.init(data: item as! [String : Any])
//                    self.TripArr.append(self.RecentData)
//                }
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            
//            self.recenTable.reloadData()
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//        
//    }

}
extension recentTripViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TripArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecentTableCell
        cell.bhView.ShadowWithCorner()
        cell.seatNeed_lbl.isHidden = true
        cell.date_lbl.text = TripArr[indexPath.row].leaving
        cell.source_lbl.setTitle(TripArr[indexPath.row].origin, for: .normal)
        cell.destination_lbl.setTitle(TripArr[indexPath.row].destination, for: .normal)
        let availableSeat = TripArr[indexPath.row].pending_seats
        let booking = "\(TripArr[indexPath.row].bookings)"
        cell.available_lbl.text = "\(availableSeat) seat left"
        booking == "0" ? (cell.matches_labl.text = "No matches yet") : (cell.matches_labl.text = "Bookings:\(booking)")
       
        let trip_Ststus = getTripStaus(ststus: TripArr[indexPath.row].trip_status)
        cell.trip_status.text = trip_Ststus
       
        return cell
    }
}
