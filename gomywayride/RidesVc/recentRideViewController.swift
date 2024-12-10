//
//  recentRideViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-2 on 29/11/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class recentRideViewController: UIViewController {

   
    var resultsArr = NSArray()
    
    @IBOutlet weak var listTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewDidAppear(_ animated: Bool) {
         
    }
    
       

}
extension recentRideViewController: UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! searchTableCell
       
        cell.iteminage.imageCircle()
        cell.bgview.ShadowWithCorner()
        let source = (resultsArr[indexPath.row] as AnyObject).value(forKey: "origin") as? String ?? ""
        let destination = (resultsArr[indexPath.row] as AnyObject).value(forKey: "destination") as? String ?? ""
        let seatLeft = (resultsArr[indexPath.row] as AnyObject).value(forKey: "seats_booked") as? String ?? ""
        
        let userImage = (resultsArr[indexPath.row] as AnyObject).value(forKey: "driver_image_url") as? String ?? ""
        
        let userName = (resultsArr[indexPath.row] as AnyObject).value(forKey: "username") as? String ?? ""
        
        let pricePerSeat = (resultsArr[indexPath.row] as AnyObject).value(forKey: "price_per_seat") as? String ?? ""
        
        let leavingDate = (resultsArr[indexPath.row] as AnyObject).value(forKey: "leaving") as? String ?? ""
        
        cell.seat_left.text = "Bookings: \(seatLeft)"
        cell.price_lbl.text = "$: \(pricePerSeat)"
        cell.source_lbl.setTitle(source, for: .normal)
        cell.destinationlbl.setTitle(destination, for: .normal)
        cell.iteminage.sd_setImage(with: URL(string: userImage), placeholderImage: UIImage(named: "userAvatar"), options: .refreshCached, context: nil)
        cell.name_lbl.text = userName
        
        cell.date_lbl.text = leavingDate
        
        let ride_status = (resultsArr[indexPath.row] as AnyObject).value(forKey: "status") as? String ?? ""
        
        cell.details_lbl.text = getRideStatus(status: ride_status)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let request_id =  (resultsArr[indexPath.row] as AnyObject).value(forKey: "request_id") as? String ?? ""
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "requestToBookViewController") as! requestToBookViewController
        vc.request_id = request_id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
