//
//  upcommingtripViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 07/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class upcommingtripViewController: UIViewController {
    
    @IBOutlet weak var upcomingTable: UITableView!
    
    var UpcomingData : UpcomingTripDataModel!
    var TripArr = [UpcomingTripDataModel]()
    var viewModel = TabBarsVM()
    var arrRecentTrip = [RecentTripData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingTable.dataSource = self
        upcomingTable.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedUpcomingTripsNotification(notification:)), name: Notification.Name("NotificationMyTripsUpcomeing"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedUpcomingRidesNotification(notification:)), name: Notification.Name("NotificationMyRidesUpcomeing"), object: nil)
       // upcomingTable.tableFooterView = UIView(frame: .zero)
    }
    
    @objc func methodOfReceivedUpcomingTripsNotification(notification: Notification) {
//       UpcomingTrip()
        UpcomingTripApi()
    }
    
    @objc func methodOfReceivedUpcomingRidesNotification(notification: Notification) {
//        upcomingRide()
        upcomingRideApi()
    }
    func UpcomingTripApi(){
        viewModel.getUpComingTripApi { data in
            if let recentTripData = data {
                
                self.arrRecentTrip = recentTripData
                
                self.upcomingTable.reloadData()
                
            }
        }
    }
//    func UpcomingTrip()  {
//        
//        
//        let param = ["token":fethToken(),"type":"upcoming"]
//        
//        
//        APIManager().postDatatoServer(UpcomingTripApi_endpoint, parameter: param as NSDictionary, success: { (response) in
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
//                    self.UpcomingData = UpcomingTripDataModel.init(data: item as! [String : Any])
//                    self.TripArr.append(self.UpcomingData)
//                }
//               
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//                self.upcomingTable.reloadData()
//            
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//        
//    }
    func upcomingRideApi() {
        viewModel.myRideApi { data in
            if let recentTripData = data {
                
                self.arrRecentTrip = recentTripData
                
                self.upcomingTable.reloadData()
                
            }
        }
    }
//    func upcomingRide() {
//        
//        let param = ["token":fethToken(),"type":"upcoming"]
//        
//        
//        APIManager().postDatatoServer(passengerUpcomingApi_endpoint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            self.TripArr.removeAll()
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            
//            
//            if status == true
//            {
//                let dataArr = result?["data"] as? NSArray ?? []
//                
//                for item in dataArr
//                {
//                    self.UpcomingData = UpcomingTripDataModel.init(data: item as! [String : Any])
//                    self.TripArr.append(self.UpcomingData)
//                   
//                }
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            DispatchQueue.main.async {
//                self.upcomingTable.reloadData()
//            }
//            
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//        
//    }
    
    @objc func detailsAction(sender:UIButton)  {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tripDetailsViewController") as! tripDetailsViewController
//        vc.Trip_Id = TripArr[sender.tag].trip_id
        vc.Trip_Id = arrRecentTrip[sender.tag].tripID ?? ""
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
extension upcommingtripViewController: UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRecentTrip.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecentTableCell
          cell.bhView.ShadowWithCorner()
//        cell.seatNeed_lbl.isHidden = true
//        cell.date_lbl.text = TripArr[indexPath.row].leaving
//        cell.source_lbl.setTitle(TripArr[indexPath.row].origin, for: .normal)
//        cell.destination_lbl.setTitle(TripArr[indexPath.row].destination, for: .normal)
//        let availableSeat = TripArr[indexPath.row].pending_seats
//        let booking = "\(TripArr[indexPath.row].bookings)"
//        cell.available_lbl.text = "\(availableSeat) seat left"
//        booking == "0" ? (cell.matches_labl.text = "No matches yet") : (cell.matches_labl.text = "Bookings:\(booking)")
        return cell
    }
}
