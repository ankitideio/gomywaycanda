//
//  PayoutViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-2 on 21/11/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit


class PayoutViewController: UIViewController {

    @IBOutlet weak var payoutTable: UITableView!
    
    var payoutArr = NSArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Payouts"

        payoutTable.tableFooterView = UIView(frame: .zero)
        
//        getPayoutDetails()
    }
    
//    func getPayoutDetails()  {
//        
//        let param = ["token":fethToken()]
//        
//        
//        APIManager().postDatatoServer(paymentAPI_endpoint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            
//            if status == true
//            {
//                
//               
//                self.payoutArr = result?["data"] as? NSArray ?? []
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            
//            self.payoutTable.reloadData()
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//        
//    }

  
}
extension PayoutViewController:UITableViewDelegate,UITableViewDataSource
    
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payoutArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! payoutTableCell
        cell.bgView.ShadowWithCorner()
       let Fname = (payoutArr[indexPath.row] as AnyObject).value(forKey: "first_name") as? String ?? ""
        let Lname = (payoutArr[indexPath.row] as AnyObject).value(forKey: "last_name") as? String ?? ""
        let TrsnId = (payoutArr[indexPath.row] as AnyObject).value(forKey: "transaction_id") as? String ?? ""
         let total_amount = (payoutArr[indexPath.row] as AnyObject).value(forKey: "total_amount") as? String ?? ""
         let leaving = (payoutArr[indexPath.row] as AnyObject).value(forKey: "leaving") as? String ?? ""
        let destination = (payoutArr[indexPath.row] as AnyObject).value(forKey: "destination") as? String ?? ""
        let origin = (payoutArr[indexPath.row] as AnyObject).value(forKey: "origin") as? String ?? ""
        
        cell.name_lbl.text = "\(Fname) \(Lname)"
        cell.taxLbl.text = "Txn:\(TrsnId)"
        cell.point_lbl.text = "$\(total_amount)"
        cell.source_lbl.setTitle(origin, for: .normal)
        cell.deslbl.setTitle(destination, for: .normal)
        cell.date_lbl.text = leaving
        cell.nuberLbl.text = total_amount
        return cell
        
    }
}
