//
//  notificationViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 06/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class notificationViewController: UIViewController {
    @IBOutlet weak var pushBtn: UISwitch!
    @IBOutlet weak var smsBtn: UISwitch!
    
    @IBOutlet weak var emailBtn: UISwitch!
    @IBOutlet weak var scroll_view: UIScrollView!
    
    @IBOutlet weak var main_view: UIView!
    
    
    var PushStatus = String()
    var EmailStatus = String()
    var SmsStatus = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notification"
        scroll_view.ShadowColorView()
//        getNotfiactionSettings()
    }
    
//    func getNotfiactionSettings()  {
//        
//        let param = ["token":fethToken()]
//        
//        APIManager().postDatatoServer(getNotificationApi_endpoint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            
//            
//            if status == true
//            {
//                
//               if let notificationArr = result?["data"] as? NSArray
//               {
//                
//                let pushDict = notificationArr[0] as? NSDictionary ?? [:]
//                self.PushStatus = pushDict["status"] as? String ?? ""
//                self.PushStatus == "0" ? (self.pushBtn.isOn = false) : (self.pushBtn.isOn = true)
//
//                let EmailDict = notificationArr[1] as? NSDictionary ?? [:]
//                self.EmailStatus = EmailDict["status"] as? String ?? ""
//                self.EmailStatus == "0" ? (self.emailBtn.isOn = false) : (self.emailBtn.isOn = true)
//
//                let SmsDict = notificationArr[2] as? NSDictionary ?? [:]
//                self.SmsStatus = SmsDict["status"] as? String ?? ""
//                self.SmsStatus == "0" ? (self.smsBtn.isOn = false) : (self.smsBtn.isOn = true)
//                
//                }
//                
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            
//            
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//    }
//    
//    func saveNofication()  {
//        
//        
//        let param = ["token":fethToken(),"sms":SmsStatus,"email":EmailStatus,"push":PushStatus]
//        
//        APIManager().postDatatoServer(saveNotificationApi_endpint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            
//            
//            if status == true
//            {
//                
//              sucessToast(view: self.view, message: messageStr)
//                
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            
//            
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//    }
    
    //MARK:- IBAction
    
    @IBAction func emailAction(_ sender: Any) {
        
        emailBtn.isOn ? (print("true")) : (print("false"))
        
        emailBtn.isOn ? (EmailStatus = "1") : (EmailStatus = "0")
    }
    
    @IBAction func smsAction(_ sender: Any) {
        
        smsBtn.isOn ? (SmsStatus = "1") : (SmsStatus = "0")
    }
    
    @IBAction func pushAction(_ sender: Any) {
        
        pushBtn.isOn ? (PushStatus = "1") : (PushStatus = "0")
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
//        saveNofication()
    }
}
