//
//  BaseTripVC.swift
//  gomywayride
//
//  Created by Prince dhiman on 20/10/22.
//  Copyright © 2022 Snow-Macmini-1. All rights reserved.
//

import UIKit

class BaseTripVC: UIViewController {

    @IBOutlet weak var lblTrips: UILabel!
    @IBOutlet weak var trip_outlet: UIButton!
    @IBOutlet weak var ride_Outlet: UIButton!
    @IBOutlet weak var first_Label: UILabel!
    @IBOutlet weak var second_Label: UILabel!
    @IBOutlet weak var upcoming_Outlet: UIButton!
    @IBOutlet weak var recent_Outlet: UIButton!
    @IBOutlet weak var up_label: UILabel!
    @IBOutlet weak var recent_Label: UILabel!
    @IBOutlet weak var tblVwRides: UITableView!
    
    var isColorChnage = false
    var iscolourChange = false
    var status:Int?
    var Data : RecentTripDataModel!
    var TripArr = [RecentTripDataModel]()
    var viewModel = TabBarsVM()
    var arrRecentTrip = [RecentTripData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblVwRides.dataSource = self
        saveTripStatus(tripStatus: 1)
        saveTripStateStatus(tripStateStatus: 1)
        first_Label.backgroundColor = UIColor(red: 106/255, green: 161/255, blue: 33/255, alpha: 1.0)
        second_Label.isHidden = true
        second_Label.backgroundColor = UIColor(red: 106/255, green: 161/255, blue: 33/255, alpha: 1.0)
        up_label.backgroundColor = UIColor(red: 106/255, green: 161/255, blue: 33/255, alpha: 1.0)
        recent_Label.isHidden = true
        iscolourChange = false
  
        isColorChnage = true
        colorChnage()
        first_Label.isHidden = false
        second_Label.isHidden = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        setLanguage()
        UpcomingTripApi()
    }
    private func setLanguage(){
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
          
            trip_outlet.setTitle("myTrips".localizeString(string: "fr-CA"), for: .normal)
            ride_Outlet.setTitle("myRides".localizeString(string: "fr-CA"), for: .normal)
            upcoming_Outlet.setTitle("upComing".localizeString(string: "fr-CA"), for: .normal)
            recent_Outlet.setTitle("recent".localizeString(string: "fr-CA"), for: .normal)
            if getTripStatus() == 1{
                lblTrips.text = "trips".localizeString(string: "fr-CA")
            }else{
                lblTrips.text = "ride".localizeString(string: "fr-CA")
            }
        }else{
            trip_outlet.setTitle("myTrips".localizeString(string: "en"), for: .normal)
            ride_Outlet.setTitle("myRides".localizeString(string: "en"), for: .normal)
            upcoming_Outlet.setTitle("upComing".localizeString(string: "en"), for: .normal)
            recent_Outlet.setTitle("recent".localizeString(string: "en"), for: .normal)
            if getTripStatus() == 1{
                lblTrips.text = "trips".localizeString(string: "en")
            }else{
                lblTrips.text = "ride".localizeString(string: "en")
            }
          
        }
    }
    func colorChnage() {
        if isColorChnage{
            trip_outlet.setTitleColor(UIColor(red: 106/255, green: 161/255, blue: 33/255, alpha: 1.0), for: .normal)
            ride_Outlet.setTitleColor(.gray, for: .normal)
        } else
        {
            trip_outlet.setTitleColor(.gray, for: .normal)
            ride_Outlet.setTitleColor(UIColor(red: 106/255, green: 161/255, blue: 33/255, alpha: 1.0), for: .normal)
        }
    }
    func colourChange() {
        if iscolourChange{
            upcoming_Outlet.setTitleColor(UIColor(red: 106/255, green: 161/255, blue: 33/255, alpha: 1.0), for: .normal)
            recent_Outlet.setTitleColor(.gray, for: .normal)
        } else
        {
            upcoming_Outlet.setTitleColor(.gray, for: .normal)
            recent_Outlet.setTitleColor(UIColor(red: 106/255, green: 161/255, blue: 33/255, alpha: 1.0), for: .normal)
        }
    }
    
    @IBAction func search_Butn(_ sender: Any) {
        passToNextVC(IDStr: "postRequestViewController")
        
    }
    
    @IBAction func plus_Butn(_ sender: Any) {
        passToNextVC(IDStr: "postTripViewController")
    }
    
    @IBAction func actionView(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tripDetailsViewController") as! tripDetailsViewController
        
        vc.Trip_Id = arrRecentTrip[sender.tag].tripID ?? ""
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func GetTripcontroller(){
        if getTripStatus() == 1{
            if getTripStateStatus() == 1{

                UpcomingTripApi()
            }else{

                RecentTripApi()
            }
        }else{
            if getTripStateStatus() == 1{

                upcomingRideApi()
            }else{
               recentRideApi()
            }
        }
    }
    
    @IBAction func trip_Butn(_ sender: Any) {
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {

            lblTrips.text = "trips".localizeString(string: "fr-CA")
        }else{
            lblTrips.text = "trips".localizeString(string: "en")
        }
        saveTripStatus(tripStatus: 1)
        print(getTripStatus())
        isColorChnage = true
        colorChnage()
        first_Label.isHidden = false
        second_Label.isHidden = true
        GetTripcontroller()
      
    }
    
    @IBAction func ride_Butn(_ sender: Any) {
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            lblTrips.text = "ride".localizeString(string: "fr-CA")
        }else{
            lblTrips.text = "ride".localizeString(string: "en")
          
        }
        saveTripStatus(tripStatus: 2)
        print(getTripStatus())
        isColorChnage = false
        colorChnage()
        first_Label.isHidden = true
        second_Label.isHidden = false
        GetTripcontroller()

    }
    
    
    @IBAction func upcoming_butn(_ sender: Any) {
        
        saveTripStateStatus(tripStateStatus: 1)
        iscolourChange = true
        colourChange()
        up_label.isHidden = false
        recent_Label.isHidden = true
        GetTripcontroller()

    }
    
    @IBAction func recent_Butn(_ sender: Any) {
        
      saveTripStateStatus(tripStateStatus: 2)
        iscolourChange = false
        colourChange()
        up_label.isHidden = true
        recent_Label.isHidden = false
        GetTripcontroller()

    }
    
    func RecentTripApi(){
        viewModel.getRecentTripApi{ data in
            
            self.arrRecentTrip.removeAll()
                
                self.arrRecentTrip = data ?? []
                
                self.tblVwRides.reloadData()
                
            
        }
    }
   
    func UpcomingTripApi(){
        viewModel.getUpComingTripApi { data in
            self.arrRecentTrip.removeAll()
                self.arrRecentTrip = data ?? []
                
                self.tblVwRides.reloadData()
                
            
        }
    }
    
    func upcomingRideApi() {
        viewModel.myRideApi { data in
          
            self.arrRecentTrip.removeAll()
                self.arrRecentTrip = data ?? []
                
                self.tblVwRides.reloadData()
                
            
        }
    }
    func recentRideApi() {
        viewModel.myRideApiRecent { data in
            self.arrRecentTrip.removeAll()
                
                self.arrRecentTrip = data ?? []
                
                self.tblVwRides.reloadData()
                
            
        }
    }
   
    
}

extension UIScrollView{
    func scrollTo(horizontalPage:Int? = 0){
    var frame:CGRect = self.frame
    frame.origin.x = frame.size.width * CGFloat(horizontalPage ?? 0)
    self.scrollRectToVisible(frame, animated: true)
    }
}
extension BaseTripVC: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRecentTrip.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwRides.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecentTableCell
        cell.bhView.ShadowWithCorner()
        cell.seatNeed_lbl.text = "$ \(arrRecentTrip[indexPath.row].pricePerSeat ?? "")"
        cell.date_lbl.text = arrRecentTrip[indexPath.row].leaving
        cell.source_lbl.setTitle(arrRecentTrip[indexPath.row].origin, for: .normal)
        cell.destination_lbl.setTitle(arrRecentTrip[indexPath.row].destination, for: .normal)
        cell.available_lbl.text = "Bookings : \(arrRecentTrip[indexPath.row].availableSeats ?? "")"
        cell.imgProfile.sd_setImage(with: URL(string: "https://gomywayride.com/uploads/users/" +  (arrRecentTrip[indexPath.row].profileURL ?? "")), placeholderImage: UIImage(named: "userAvatar"), options: .refreshCached, context: nil)
        let trip_Ststus = getTripStaus(ststus: arrRecentTrip[indexPath.row].tripStatus ?? "")
        cell.trip_status.text = trip_Ststus
        cell.imgProfile.imageCircle()
        cell.btnDetail.tag = indexPath.row
        return cell
    }
}
