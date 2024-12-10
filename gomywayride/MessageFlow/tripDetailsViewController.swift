//
//  tripDetailsViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 09/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class tripDetailsViewController: UIViewController {

    @IBOutlet weak var lblVehicleDetail: UILabel!
    @IBOutlet weak var lblDrop: UILabel!
    @IBOutlet weak var lblPickUp: UILabel!
    @IBOutlet weak var lblOpenCloseTrip: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var leave_date: UILabel!
    @IBOutlet weak var vehicle_collectionView: UICollectionView!
    @IBOutlet weak var tyre_lbl: UILabel!
    @IBOutlet weak var snow_lbl: UILabel!
    @IBOutlet weak var pets_lbl: UILabel!
    @IBOutlet weak var bikes_lbl: UILabel!
    @IBOutlet weak var luggege_lbl: UILabel!
    @IBOutlet weak var people_lbl: UILabel!
    @IBOutlet weak var aboutLbl: UILabel!
    @IBOutlet weak var price_lbl: UILabel!
    @IBOutlet weak var seat_left: UILabel!
    @IBOutlet weak var destination_lbl: UILabel!
    @IBOutlet weak var source_lbl: UILabel!
    @IBOutlet weak var switchBtn: UISwitch!
    @IBOutlet weak var scrool_view: UIScrollView!
    @IBOutlet weak var bg_view: UIView!
    
    var Trip_Id = String()
    var vehicalData : vehicalDataModel!
    var vehicleModelArr = [vehicalDataModel]()
    var userId = String()
    var dataDict = NSDictionary()
    var viewModel = FindTripVM()
    var viewTrip:TripDetailData?
    var arrTripStop = [TripStopPoint]()
    var url:String?
    var model:String?
    var vehicleType:String?
    var vehicleName:String?
    var vehicleNo:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            lblTitle.text = "tripDetail".localizeString(string: "fr-CA")
            lblPickUp.text = "pickup".localizeString(string: "fr-CA")
            lblDrop.text = "dropOff".localizeString(string: "fr-CA")
            lblVehicleDetail.text = "vehicleDetail".localizeString(string: "fr-CA")
            lblOpenCloseTrip.text = "tripOpenClose".localizeString(string: "fr-CA")
        }else{
            lblTitle.text = "tripDetail".localizeString(string: "en")
            lblPickUp.text = "pickup".localizeString(string: "en")
            lblDrop.text = "dropOff".localizeString(string: "en")
            lblVehicleDetail.text = "vehicleDetail".localizeString(string: "en")
            lblOpenCloseTrip.text = "tripOpenClose".localizeString(string: "en")
  
        }
        scrool_view.ShadowColorView()

         getTripDetailsApi()
    }
    
    func otherCheckDeials(others:String)  {
        
        switch others {
        case "0":
            pets_lbl.attributedText = "Pets".strikeThrough()
             bikes_lbl.attributedText = "Bikes".strikeThrough()
             snow_lbl.attributedText = "Snow Boards".strikeThrough()
            tyre_lbl.text = "Tyres"
        case "1":
            pets_lbl.attributedText = "Pets".strikeThrough()
            bikes_lbl.text = "Bikes"
            snow_lbl.attributedText = "Snow Boards".strikeThrough()
            tyre_lbl.attributedText = "Tyres".strikeThrough()
        case "2":
            pets_lbl.attributedText = "Pets".strikeThrough()
            bikes_lbl.attributedText = "Bikes".strikeThrough()
            snow_lbl.text = "Snow Boards"
            tyre_lbl.attributedText = "Tyres".strikeThrough()
        case "3":
            pets_lbl.text = "Pets"
            bikes_lbl.attributedText = "Bikes".strikeThrough()
            snow_lbl.attributedText = "Snow Boards".strikeThrough()
            tyre_lbl.attributedText = "Tyres".strikeThrough()
        default:
            pets_lbl.text = "Pets"
            bikes_lbl.text = "Bikes"
            snow_lbl.text = "Snow Boards"
            tyre_lbl.text = "Tyres"
        }
        
    }
    
    func populateData(dict:NSDictionary)  {
        
        print(dict)
        
        self.source_lbl.text = dict["origin"] as? String ?? ""
        self.destination_lbl.text = dict["destination"] as? String ?? ""
        let trip_status = dict["trip_status"] as? String ?? ""
        trip_status == "0" ? (switchBtn.isOn = true) : (switchBtn.isOn = false)
        let available_seats = dict["available_seats"] as? String ?? ""
        let luggage = dict["luggage"] as? String ?? ""
        let back_row_seating = dict["back_row_seating"] as? String ?? ""
        let others_Str = dict["others"] as? String ?? ""
        self.seat_left.text = "\(available_seats) seats left"
        let price_per_seat = dict["price_per_seat"] as? String ?? ""
        self.price_lbl.text = "$: \(price_per_seat) per seat"
        self.aboutLbl.text = dict["description"] as? String ?? ""
        self.luggege_lbl.text = getLogguage(value:luggage )
        self.people_lbl.text = getBackSeatNumber(value:back_row_seating)
        self.otherCheckDeials(others: others_Str)
        let leaving = dict["leaving"] as? String ?? ""
        leave_date.text = "Leaving at: \(leaving)"
        userId = dict["id"] as? String ?? ""
        
        
        
    }
    //MARK: - getTripDetailsApi
    func getTripDetailsApi()  {
        viewModel.tripDetailApi(token: fethToken(), Trip_Id: Trip_Id) { data in
            self.arrTripStop = data?.tripStopPoints ?? []
            self.viewTrip = data
            self.source_lbl.text = data?.viewTrip?.origin ?? ""
            self.destination_lbl.text = data?.viewTrip?.destination ?? ""
            let trip_status = data?.viewTrip?.tripStatus ?? ""
            trip_status == "0" ? (self.switchBtn.isOn = true) : (self.switchBtn.isOn = false)
            let available_seats = data?.viewTrip?.availableSeats ?? ""
            let luggage = data?.viewTrip?.luggage ?? ""
            let back_row_seating = data?.viewTrip?.backRowSeating ?? ""
            let others_Str = data?.viewTrip?.others ?? ""
            self.seat_left.text = "\(available_seats) seats left"
            let price_per_seat = data?.viewTrip?.pricePerSeat ?? ""
            self.price_lbl.text = "$: \(price_per_seat) per seat"
            self.aboutLbl.text = data?.viewTrip?.description ?? ""
            self.luggege_lbl.text = getLogguage(value:luggage )
            self.people_lbl.text = getBackSeatNumber(value:back_row_seating)
            self.otherCheckDeials(others: others_Str)
            let leaving = data?.viewTrip?.leaving ?? ""
            self.leave_date.text = "Leaving at: \(leaving)"
            self.userId = data?.viewTrip?.userID ?? ""
            
            self.url = data?.viewTrip?.vehicleURLPath ?? ""
            self.model = data?.viewTrip?.model ?? ""
            self.vehicleType = data?.viewTrip?.vehicleType ?? ""
            self.vehicleName = data?.viewTrip?.vehicleName ?? ""
            self.vehicleNo = data?.viewTrip?.plateNumber ?? ""
            self.vehicle_collectionView.reloadData()
        }
    }
    //MARK: - tripCloseApi
    func tripCloseApi(trip_status:String)  {
        
        viewModel.closeTripApi(token: fethToken(), tripId: Trip_Id, trip_status: trip_status) { data in
            
        }
    }
    //MARK: - tripCancelApi
    func tripCancelApi(tripStatus:String)  {
        
        viewModel.cancelTripApi(token: fethToken(), tripId: Trip_Id, trip_status: tripStatus) { data in
            
            self.navigationController?.popViewController(animated: true)
            
        }
    }
    //MARK: - tripCompleteApi
    func tripCompleteApi(trip_Status:String)  {
        
        viewModel.completeTripApi(token: fethToken(), tripId: Trip_Id, trip_status: trip_Status) { data in
            
            self.navigationController?.popViewController(animated: true)
            
        }
    }
    
   
    
    //MARK: - MoreAction
    
    func ConfirmationAlert(message:String,titleStr:String,isCancelTrip:Bool)  {
        
        let alertVc = UIAlertController(title: titleStr, message: message, preferredStyle: .alert)
        
        let Confirm = UIAlertAction(title: "Confirm", style: .default) { (Action) in
            
            isCancelTrip == true ? self.tripCancelApi(tripStatus: "3") : self.tripCompleteApi(trip_Status: "2")
        }
        let Cancel = UIAlertAction(title: "Cancel", style: .destructive) { (Action) in
            
        }
        alertVc.addAction(Cancel)
        alertVc.addAction(Confirm)
        
        present(alertVc, animated: true, completion: nil)
    }
    
    func AlertSheet()  {
        
        let AlertVc = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let EditTrip = UIAlertAction(title: "Edit Trip", style: .default) { (Action) in
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "requestLoadWebViewController") as! requestLoadWebViewController
            vc.isEditTrip = true
            vc.userID = self.userId
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        let CancelTrip = UIAlertAction(title: "Cancel Trip", style: .destructive) { (Action) in
            
            self.ConfirmationAlert(message: "Are you sure want to cancel this trip?", titleStr: "Confirmation!", isCancelTrip: true)
        }
        let CompleteTrip = UIAlertAction(title: "Mark as complete", style: .default) { (Action) in
            
            self.ConfirmationAlert(message: "Are you sure want to mark as complete trip?", titleStr: "Confirmation!", isCancelTrip: false)
        }
        let ShareTrip = UIAlertAction(title: "Share trip", style: .default) { (Action) in
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
       
        AlertVc.addAction(EditTrip)
         AlertVc.addAction(CancelTrip)
         AlertVc.addAction(CompleteTrip)
         AlertVc.addAction(ShareTrip)
        AlertVc.addAction(cancel)
        
        //For iPad
        if let popoverPresentationController = AlertVc.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        }
        
        present(AlertVc, animated: true, completion: nil)
    }
    func AlertSheetFrench()  {
        
        let AlertVc = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let EditTrip = UIAlertAction(title: "Modifier le voyage", style: .default) { (Action) in
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "requestLoadWebViewController") as! requestLoadWebViewController
            vc.isEditTrip = true
            vc.userID = self.userId
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        let CancelTrip = UIAlertAction(title: "Annuler le voyage", style: .destructive) { (Action) in
            
            self.ConfirmationAlert(message: "Are you sure want to cancel this trip?", titleStr: "Confirmation!", isCancelTrip: true)
        }
        let CompleteTrip = UIAlertAction(title: "Rendre aussi complet", style: .default) { (Action) in
            
            self.ConfirmationAlert(message: "Are you sure want to mark as complete trip?", titleStr: "Confirmation!", isCancelTrip: false)
        }
        let ShareTrip = UIAlertAction(title: "Partager le voyage", style: .default) { (Action) in
            
        }
        let cancel = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
       
        AlertVc.addAction(EditTrip)
         AlertVc.addAction(CancelTrip)
         AlertVc.addAction(CompleteTrip)
         AlertVc.addAction(ShareTrip)
        AlertVc.addAction(cancel)
        
         //For iPad
            if let popoverPresentationController = AlertVc.popoverPresentationController {
                popoverPresentationController.sourceView = self.view
                popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            }
        
        present(AlertVc, animated: true, completion: nil)
    }
    //MARK:- IBAction
    
    @IBAction func directionAction(_ sender: Any) {
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RouteViewController") as! RouteViewController
        vc.tripDetails = viewTrip
      
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func tripSwitchAction(_ sender: Any) {
        
        if switchBtn.isOn
        {

            tripCloseApi(trip_status: "0")
        }
        else
        {

            tripCloseApi(trip_status: "1")
        }
        
        
    }
    
    @IBAction func oreAction(_ sender: Any) {
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            AlertSheetFrench()
        }else{
            AlertSheet()
           
        }
    
    }
    
    @IBAction func back_btn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
//MARK: - UICollectionViewDataSource
extension tripDetailsViewController: UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! vehicleTableCell
        cell.deleteBtn.isHidden = true
        cell.vehImage.sd_setImage(with: URL(string: url ?? ""), placeholderImage: UIImage(named: "userAvatar"), options: .refreshCached, context: nil)
        cell.modelLbl.text = "Vehicle Model: \(model ?? "")"
        cell.vehtype.text = "Vehicle Type: \(vehicleType ?? "")"
        cell.vehName.text = vehicleName
        cell.plateNo.text = vehicleNo
       
        return cell
        
    }
}

