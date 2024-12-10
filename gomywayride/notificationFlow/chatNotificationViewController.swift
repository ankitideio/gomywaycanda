//
//  chatNotificationViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 07/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class chatNotificationViewController: UIViewController {

    @IBOutlet weak var table_view: UITableView!
    
    let sectionArr = ["Notification"]
    var resultArr = NSArray()
    var viewModel = TabBarsVM()
    var arrNotifications = [NotificationData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table_view.tableFooterView = UIView(frame: .zero)
        table_view.ShadowColorView()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

        getAllNotificationApi()
    }
    //MARK: - GetAllNotificationApi
    func getAllNotificationApi() {
        
        viewModel.getAllNotificationsApi(token: fethToken()) { data in
            
                   self.arrNotifications = data.compactMap { $0 }
            
                   self.table_view.reloadData()
            
        }
    }
   
    
    //MARK : - IBAction
    
    @IBAction func add_post_request_btn_Action(_ sender: Any) {
        
        passToNextVC(IDStr: "postTripViewController")
    }
    
   
    @IBAction func searchTap(_ sender: Any) {
        
        passToNextVC(IDStr: "postRequestViewController")
    }
    
}
//MARK: - UITableViewDelegate
extension chatNotificationViewController: UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArr.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNotifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! chatNotifcationTableCell
        
        cell.userImage.imageCircle()
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            cell.message_lbl.text = arrNotifications[indexPath.row].notification_french ?? ""
           
        }else{
            cell.message_lbl.text = arrNotifications[indexPath.row].notification ?? ""
        }
       
        cell.name_lbl.text = "\(arrNotifications[indexPath.row].firstName ?? "") \(arrNotifications[indexPath.row].lastName ?? "")"
        cell.userImage.sd_setImage(with: URL(string: arrNotifications[indexPath.row].profileImageUrl ?? ""), placeholderImage: UIImage(named: "userAvatar"), options: .refreshCached, context: nil)
        cell.time_lbl.text = arrNotifications[indexPath.row].time ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let lable = UILabel(frame: CGRect(x: 10, y: 0, width: 200, height: 25))
        headerView.backgroundColor = UIColor.white
        lable.font = UIFont(name: "Roboto-Bold", size: 17)
        lable.text = sectionArr[section]
        lable.textColor = UIColor.black
        headerView.addSubview(lable)
        return headerView
    }
   
    
    
}

