//
//  OfferViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-2 on 21/11/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class OfferViewController: UIViewController {
    
    var CouponsArr = NSArray()
    

    @IBOutlet weak var couponTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Offers"
        couponTable.tableFooterView = UIView(frame: .zero)
//        getOffers()
    }
    
//    func getOffers()  {
//        
//        let param = ["token":fethToken()]
//        
//        
//        APIManager().postDatatoServer(couponsAPI_endpoint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            
//            if status == true
//            {
//                
//                self.CouponsArr = result?["data"] as? NSArray ?? []
//                
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            
//            self.couponTable.reloadData()
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//    }
//    
    //MARK:- IBAction
    
    @objc func copyAction(sender:UIButton)  {
        
        let copnCode = (CouponsArr[sender.tag] as AnyObject).value(forKey: "coupon_code") as? String ?? ""
        
        
        UIPasteboard.general.string = copnCode
        
        sucessToast(view: self.view, message: "Copied Successfully")
    }
 

}
extension OfferViewController:UITableViewDelegate,UITableViewDataSource

{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CouponsArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! offerTableCell
        cell.copyBtn.tag = indexPath.row
        cell.bgView.ShadowWithCorner()
        let dateFrom = (CouponsArr[indexPath.row] as AnyObject).value(forKey: "valid_from") as? String ?? ""
        let dateTo = (CouponsArr[indexPath.row] as AnyObject).value(forKey: "valid_to") as? String ?? ""
        cell.dateLbl.text = "Latest offer(valid from:\(dateFrom) to \(dateTo))"
        cell.Title_lbl.text = (CouponsArr[indexPath.row] as AnyObject).value(forKey: "coupon_name") as? String ?? ""
        cell.voucher_lbl.text = (CouponsArr[indexPath.row] as AnyObject).value(forKey: "coupon_code") as? String ?? ""
        cell.copyBtn.addTarget(self, action: #selector(copyAction), for: .touchUpInside)
        return cell
        
    }
}
