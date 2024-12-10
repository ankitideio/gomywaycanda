//
//  PayOutsVC.swift
//  GomywayCanada
//
//  Created by meet sharma on 07/08/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import UIKit

class PayOutsVC: UIViewController {

    @IBOutlet weak var tblVwPayout: UITableView!
    
    var arrPayment = [PaymentListModel]()
    var arrPayout = [PayOutData]()
    var viewModel = MoreDetailsVM()
    override func viewDidLoad() {
        super.viewDidLoad()

       uiSet()
    }
    func uiSet(){
       
        tblVwPayout.delegate = self
        tblVwPayout.dataSource = self
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            self.title = "payouts".localizeString(string: "fr-CA")
           
        }else{
            self.title = "payouts".localizeString(string: "en")
            
           
        }

        getPaymentListApi()
    }
    
    func getPaymentListApi(){
        
        viewModel.payoutApi{ data in
           
            self.arrPayout = data?.compactMap { $0 } ?? []
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.3){
                self.tblVwPayout.reloadData()
                self.tblVwPayout.estimatedRowHeight = 20
                self.tblVwPayout.rowHeight = UITableView.automaticDimension
            }
            self.tblVwPayout.reloadData()
        }
    }
    
    

}

extension PayOutsVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPayout.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PayoutTVC", for: indexPath) as! PayoutTVC
        cell.lblName.text = "\(arrPayout[indexPath.row].first_name ?? "") \(arrPayout[indexPath.row].last_name ?? "")"
        cell.lblPrice.text = "$ \(arrPayout[indexPath.row].total_amount ?? "")"
        cell.lblFromAddress.text = arrPayout[indexPath.row].origin ?? ""
        cell.lblToAddress.text = arrPayout[indexPath.row].destination ?? ""
        cell.lblDate.text = arrPayout[indexPath.row].leaving ?? ""
        if arrPayout[indexPath.row].payment_status == "0" {
            cell.lblStatus.text = "Done"
        }else if arrPayout[indexPath.row].payment_status == "1"{
            cell.lblStatus.text = "Refund"
        }else{
            cell.lblStatus.text = "Pending"
        }
        cell.vwMain.layer.shadowColor = UIColor.gray.cgColor
        cell.vwMain.layer.shadowOpacity = 0.5
        cell.vwMain.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.vwMain.layer.shadowRadius = 2.5
        return cell
    }
    
    
}


