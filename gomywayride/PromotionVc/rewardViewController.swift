//
//  rewardViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-2 on 21/11/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class rewardViewController: UIViewController {

    @IBOutlet weak var earingLbl: UILabel!
    @IBOutlet weak var pointLbl: UILabel!
    @IBOutlet weak var rewardTbale: UITableView!
    
    var rewardArr = NSArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rewardTbale.ShadowColorView()
        rewardTbale.tableFooterView = UIView(frame: .zero)
        
//        getReferUsers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
//    func getReferUsers()  {
//        let param = ["token":fethToken()]
//        
//        
//        APIManager().postDatatoServer(referedUsersAPI_endpoint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            let dataDict = result?["data"] as? NSDictionary ?? [:]
//            
//            if status == true
//            {
//                
//                self.rewardArr = dataDict["users"] as? NSArray ?? []
//                let points = dataDict["total_earning"] as? Int ?? 0
//                
//                self.pointLbl.text = "$ \(points)"
//               
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            
//            self.rewardTbale.reloadData()
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//        
//    }
//    
    //MARK:- IBAction

    @IBAction func backTap(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}

extension rewardViewController:UITableViewDelegate,UITableViewDataSource
    
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rewardArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! rewardTableCell
        cell.itemImage.imageCircle()
        let titleStr = (rewardArr[indexPath.row] as AnyObject).value(forKey: "referredUser") as? String ?? ""
         let amountStr = (rewardArr[indexPath.row] as AnyObject).value(forKey: "commission_amount") as? String ?? ""
        let userImage = (rewardArr[indexPath.row] as AnyObject).value(forKey: "image_url") as? String ?? ""
        cell.Title_lbl.text = titleStr
        cell.pointLbl.text = "$ \(amountStr)"
        cell.itemImage.sd_setImage(with: URL(string: userImage), placeholderImage: UIImage(named: "userAvatar"), options: .refreshCached, context: nil)
        cell.dateLbl.text = (rewardArr[indexPath.row] as AnyObject).value(forKey: "created_at") as? String ?? ""
        return cell
        
    }
}
