//
//  messageViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 05/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class messageViewController: UIViewController {

    @IBOutlet weak var lblInbox: UILabel!
    @IBOutlet weak var list_table_view: UITableView!
    
    var resultArr = NSArray()
    var viewModel = TabBarsVM()
    var arrAllChat = [GetChatData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        list_table_view.tableFooterView = UIView(frame: .zero)
       list_table_view.ShadowColorView()
     
    }
    private func setLanguage(){
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            lblInbox.text = "inbox".localizeString(string: "fr-CA")
        }else{
            lblInbox.text = "inbox".localizeString(string: "en")
     
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        

        allchatListingApi()
        setLanguage()
    }
    func allchatListingApi()  {
        viewModel.getAllChatListApi(token: fethToken()) { data in
                
                self.arrAllChat = data.compactMap { $0 }
                
                self.list_table_view.reloadData()
            
        }
    }
    

    @IBAction func searchTap(_ sender: Any) {
        
        passToNextVC(IDStr: "postRequestViewController")
    }
    @IBAction func add_post_btn_Action(_ sender: Any) {
        passToNextVC(IDStr: "postTripViewController")
    }
    
}
extension messageViewController : UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAllChat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! chatlistingTableCell
        cell.userImage.imageCircle()
        cell.count_lbl.circleLabal()
        
        cell.message.text = arrAllChat[indexPath.row].lastMessage ?? ""
        cell.userName.text = arrAllChat[indexPath.row].username ?? ""
        
        cell.userImage.sd_setImage(with: URL(string: arrAllChat[indexPath.row].profileImage ?? ""), placeholderImage: UIImage(named: "userAvatar"), options: .refreshCached, context: nil)
        
        cell.time_lbl.text = arrAllChat[indexPath.row].time ?? ""
        
        let new_messages = arrAllChat[indexPath.row].newMessages ?? 0
        
        new_messages == 0 ? (cell.count_lbl.isHidden = true) : (cell.count_lbl.isHidden = false)
        cell.count_lbl.text = "\(new_messages)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ConversationChatViewController") as! ConversationChatViewController
        vc.hidesBottomBarWhenPushed = true
        vc.conversation_id = arrAllChat[indexPath.row].conversationID ?? ""
        vc.toId = arrAllChat[indexPath.row].fromUserID ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

