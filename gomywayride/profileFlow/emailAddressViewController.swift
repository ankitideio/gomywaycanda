//
//  emailAddressViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 09/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class emailAddressViewController: UIViewController {

    @IBOutlet weak var emailTable: UITableView!
    @IBOutlet weak var btnAddEmail: UIButton!
    @IBOutlet weak var scroll_view: UIScrollView!
    @IBOutlet weak var bg_view: UIView!
    
    var PrimaryDict = NSDictionary()
    var emailData : emailDetailsModel!
    var emailModelArr = [Email]()
    var viewModel = MoreDetailsVM()
    var model: GetEmailData?
    var primaryEmailNew = ""
    var arrEmailsData = [EmailDataUser]()
    var arrOtherEmail = [OtherEmail]()
    var arrPrimaryEmail:PrimaryEmail?
    var primaryEmail = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll_view.ShadowColorView()
      
       getEmailApi()

    }
    
    func getEmailApi(){
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
  
            self.title = "emailVerifications".localizeString(string: "fr-CA")
            btnAddEmail.setTitle("addAnotherEmail".localizeString(string: "fr-CA"), for: .normal)
        }else{
            self.title = "emailVerifications".localizeString(string: "en")
            btnAddEmail.setTitle("addAnotherEmail".localizeString(string: "en"), for: .normal)
        }

        viewModel.getEmailApi{ data in
            
            if let getEmailData = data {
                self.primaryEmail =  data?.primary_email?.email ?? ""
                
                let otherEmails = getEmailData.other_emails
                
                for email in otherEmails ?? [] {
                    print("Email: \(email.email ?? "")")
                    self.arrEmailsData.append(getEmailData)
                    
                }
            }
                
            }
        self.emailTable.reloadData()
    }

    func deleteEmailApi(emailStr:String,index:NSInteger){
        viewModel.deleteEmailApi(email: emailStr, type: "delete") { data in
            self.emailModelArr.remove(at: index)
            self.emailTable.reloadData()
        }
    }

    func primaryEmailApi(emailStr:String){
        viewModel.deleteEmailApi(email: emailStr, type: "primary") { data in
            self.viewDidLoad()
        }
    }

    func ReSendEmailApi()  {
        viewModel.resendVerifyApi(token: fethToken(), email: primaryEmail, emailType: "p") { data in
            
        }
    }
   

    //MARK: - IBAction
    
    @IBAction func addAction(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddEmailPopViewController") as! AddEmailPopViewController
        
        vc.callBack = { data in
            self.emailModelArr = data ?? []
            self.emailTable.reloadData()
        }
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false, completion: nil)
    }
    
    @objc func deleteAction(sender:UIButton)  {
        
        let email = emailModelArr[sender.tag].email ?? ""
        deleteEmailApi(emailStr: email, index: sender.tag)
    }
    
    
    @objc func primaryAction(sender:UIButton)  {
        
        
        print(sender.tag)
        
        if sender.tag < 0 {
            
            print("Default Cell ap")
            TostErrorMessage(view: self.view, message: "Already a primary email")
            return
        }
        
       let  email = emailModelArr[sender.tag].email
        
//        primaryEmail(emailStr: email)
         primaryEmailApi(emailStr: email ?? "")
    }
    
    @objc func ResendAction(sender:UIButton)  {
        print(sender.tag)
        
        if sender.tag < 0 {
            
            print("Default Cell ap")
            
//            let PrimaryEmail = PrimaryDict["email"] as? String ?? ""
//
//            ReSendEmail(emailStr: PrimaryEmail, EmailtypeStr: "p")
            
            ReSendEmailApi()
            return
        }
        ReSendEmailApi()
//        let  email = emailModelArr[sender.tag].email
//
//        ReSendEmail(emailStr: email, EmailtypeStr: "")
    }

}
//MARK: - UITableViewDelegate
extension emailAddressViewController: UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailModelArr.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! emailVerificationCell
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            cell.widthAddEmailBtn.constant = 175
        }else{
            cell.widthAddEmailBtn.constant = 155
        }
        cell.deleteBtn.tag = indexPath.row - 1
        
        cell.deleteBtn.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
        
        cell.primary_btn.tag = indexPath.row - 1
        
         cell.primary_btn.addTarget(self, action: #selector(primaryAction), for: .touchUpInside)
        
        cell.resend_btn.tag = indexPath.row - 1
        
        cell.resend_btn.addTarget(self, action: #selector(ResendAction), for: .touchUpInside)
        
        if indexPath.row == 0 {
            
           
            if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
                
                cell.primary_btn.setTitle("makePrimary".localizeString(string: "fr-CA"), for: .normal)
                cell.tiltle_lbl.text = "verificationTitle".localizeString(string: "fr-CA")
                cell.resend_btn.setTitle("resendVerification".localizeString(string: "fr-CA"), for: .normal)
            }else{
                cell.primary_btn.setTitle("makePrimary".localizeString(string: "en"), for: .normal)
                cell.tiltle_lbl.text = "verificationTitle".localizeString(string: "en")
                cell.resend_btn.setTitle("resendVerification".localizeString(string: "en"), for: .normal)
            }
            cell.deleteBtn.isHidden = true
            
            let PrimaryEmail = PrimaryDict["email"] as? String ?? ""
            let emailStatus = PrimaryDict["status"] as? String ?? ""
            emailStatus == "0" ? (cell.verify_lbl.text = "Unverified") : (cell.verify_lbl.text = "Verified")
            emailStatus == "0" ? (cell.verify_lbl.textColor = UIColor(red:255/255, green:79/255, blue:2/255, alpha:1.0)) : (cell.verify_lbl.textColor = UIColor(red:0.14, green:0.71, blue:0.00, alpha:1.0))
            
//            cell.email_lbl.text = "\u{2022} \(PrimaryEmail)"
            cell.email_lbl.text = Store.userDetail?.user?.email ?? ""
            
        }
        else
        {
            cell.tiltle_lbl.text = ""
            if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
             
                cell.primary_btn.setTitle("makePrimary".localizeString(string: "fr-CA"), for: .normal)
            }else{
                cell.primary_btn.setTitle("makePrimary".localizeString(string: "en"), for: .normal)
            }
           
            cell.deleteBtn.isHidden = false
            let PrimaryEmail = emailModelArr[indexPath.row - 1].email
            cell.email_lbl.text = "\u{2022} \(PrimaryEmail ?? "")"
            
            let verify_ststsu = emailModelArr[indexPath.row - 1].status
            
            verify_ststsu == "0" ? (cell.verify_lbl.text = "Unverified") : (cell.verify_lbl.text = "Verified")
            verify_ststsu == "0" ? (cell.verify_lbl.textColor = UIColor(red:255/255, green:79/255, blue:2/255, alpha:1.0)) : (cell.verify_lbl.textColor = UIColor(red:0.14, green:0.71, blue:0.00, alpha:1.0))
        }
        
        return cell
        
    }
}
