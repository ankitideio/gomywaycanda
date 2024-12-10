//
//  searchAllViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-2 on 11/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit
import HCSStarRatingView
class searchAllViewController: UIViewController {

    @IBOutlet weak var resultTable: UITableView!
    @IBOutlet weak var date_lbl: UILabel!
    @IBOutlet weak var locLbl: UILabel!
    
    @IBOutlet weak var vwPostRequest: UIView!
    var sourcePoint = String()
    var destionationPoint = String()
    var dateStr = String()
    var resultsArr = NSArray()
    var viewModel = SearchRideVM()
    var arrSearch = [SearchRideData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(sourcePoint)
        vwPostRequest.isHidden = true
        locLbl.text = "\(sourcePoint) To \(destionationPoint)"
        date_lbl.text = dateStr
        resultTable.tableFooterView = UIView(frame: .zero)

        searchResultsApi()
    }
    func searchResultsApi()  {
        viewModel.searchRideApi(token: fethToken(), fromTrip: sourcePoint, toTrip: destionationPoint, leaving: dateStr) { data in
            self.arrSearch = data ?? []
            
            if self.arrSearch.count == 0{
                self.vwPostRequest.isHidden = false
                self.resultTable.isHidden = true
            }else{
                self.vwPostRequest.isHidden = true
                self.resultTable.isHidden = false
                
            }
            self.resultTable.reloadData()
            
        }
    }
    
    
    //MARK:- IBAction
    
   @objc func viewDetails(sender:UITapGestureRecognizer)  {
    
    let tagIndex = sender.view?.tag
    
       let trip_id =  arrSearch[sender.view?.tag ?? 0].tripID ?? ""
    
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "requestLoadWebViewController") as! requestLoadWebViewController
        vc.isTripDetails = true
        vc.trip_id = trip_id
        self.navigationController?.pushViewController(vc, animated: true)
    }
  
    @IBAction func editTap(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func backTap(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionPostRequest(_ sender: Any) {
        passToNextVC(IDStr: "RequestPostVC")
    }
}
extension searchAllViewController: UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSearch.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! searchTableCell
        cell.details_lbl.cornerRadius(radius:15)
        cell.iteminage.imageCircle()
        cell.bgview.ShadowWithCorner()
        let source = arrSearch[indexPath.row].origin ?? ""
        let destination = arrSearch[indexPath.row].destination ?? ""
        let seatLeft = arrSearch[indexPath.row].pendingSeats ?? 0
        let price = arrSearch[indexPath.row].tripPrice ?? ""
        let userImage = arrSearch[indexPath.row].profileImageURL ?? ""
        
        let userName = arrSearch[indexPath.row].username ?? ""
        
         let pricePerSeat = arrSearch[indexPath.row].pricePerSeat ?? ""

        let leavingDate = arrSearch[indexPath.row].leaving ?? ""
        
        let avgRating = arrSearch[indexPath.row].avgRating ?? 0
        let number_of_reviews = arrSearch[indexPath.row].numberOfReviews ?? 0
       
        cell.seat_left.text = "Seat left: \(seatLeft) for $: \(price)"
        cell.source_lbl.setTitle(source, for: .normal)
          cell.destinationlbl.setTitle(destination, for: .normal)
        cell.iteminage.sd_setImage(with: URL(string: userImage), placeholderImage: UIImage(named: "userAvatar"), options: .refreshCached, context: nil)
        cell.name_lbl.text = userName
        
        cell.date_lbl.text = leavingDate
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDetails))
        tapGesture.numberOfTapsRequired = 1
        cell.details_lbl.isUserInteractionEnabled = true
        cell.details_lbl.tag = indexPath.row
        cell.details_lbl.addGestureRecognizer(tapGesture)
        
        let ratingLabal = HCSStarRatingView()
        ratingLabal.isUserInteractionEnabled = false
        ratingLabal.frame = CGRect(x: 0, y: 0, width: 100, height: 25)
        ratingLabal.maximumValue = 5
        ratingLabal.minimumValue = 0
        ratingLabal.allowsHalfStars = false
        ratingLabal.value = CGFloat(avgRating)
        ratingLabal.filledStarImage = UIImage(named:"filledstar")
        ratingLabal.emptyStarImage = UIImage(named:"empty_star")
        cell.ratingView.addSubview(ratingLabal)
        cell.review_lbl.text = "Reviews:\(number_of_reviews)"
        return cell
    }
    
    
}
