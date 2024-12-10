//
//  moreViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 06/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit


class moreViewController: UIViewController {
    // "BankDetails" = "Coordonnées bancaires"
    
    @IBOutlet weak var menuList_table_view: UITableView!
    
    let menuArr = ["Profile Settings","Email Verifications","ID Verfication","Payouts","Share","Help","About","Change Language","Logout","Delete Account"]
    let menuFrenchArr = ["Paramètres de profil","Vérifications par e-mail","Vérification d’identité","Paiements","Partager","Aide","À propos","Changer de langue","Déconnexion","Supprimer le compte"]
    var referalCodeStr = String()
    var viewModel = AuthVM()
    var viewModelMore = MoreDetailsVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        menuList_table_view.ShadowColorView()
        
        getReferCodeApi()
    }
    override func viewWillAppear(_ animated: Bool) {
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            self.title = "more".localizeString(string: "fr-CA")
           
        }else{
            self.title = "more".localizeString(string: "en")
        }
    }
    
    func getReferCodeApi(){
        
        viewModelMore.getReferCodeApi { data in
            
            self.referalCodeStr = data?.data ?? ""
            
        }
    }
    
    
    func deleteAccountApi()  {
        
        viewModel.deleteAccountApi(token: fethToken()) { data in
            
            appDelegate.logout()
            
        }
    }

    func logOutApi(){
        
        viewModel.logOutApi(id: fetchUserId()) { data in
            
            appDelegate.logout()
            
        }
    }
  
    
    
    func logoutAlertVc()  {
        
        let AlertVc = UIAlertController(title: "Logout", message: "Are you sure want to logout?", preferredStyle: .alert)
        let OkAction = UIAlertAction(title: "Yes", style: .default) { (Action) in
            

            self.logOutApi()
        }
        
        let Cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        AlertVc.addAction(OkAction)
        AlertVc.addAction(Cancel)
        
        present(AlertVc, animated: true, completion: nil)
        
    }
    
    //MARK: - IBACtion
    
    @objc func referFriend(sender:UIButton)  {
        
        let text = URL(string: self.referalCodeStr)
        let textShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textShare as [Any] , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    @objc func offerAction(sender:UIButton)  {
        
        passToNextVC(IDStr: "OfferViewController") 
        
    }
    @objc func moreAction(sender:UIButton)  {
        
      passToNextVC(IDStr: "rewardViewController") 
        
    }

}
extension moreViewController : UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            return menuFrenchArr.count
        }else{
            return menuArr.count
           
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! moreTableViewcell
        
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            
            cell.name_lbl.text = menuFrenchArr[indexPath.row]
            
        }else{
            
            cell.name_lbl.text = menuArr[indexPath.row]
      
        }
 
            cell.accessoryType = .disclosureIndicator
            cell.offerBtn.isHidden = true
            cell.moreBtn.isHidden = true
            cell.referbtn.isHidden = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            
        case 0:
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "editPrfileViewController") as! editPrfileViewController
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            
            passToNextVC(IDStr: "emailAddressViewController")
            
        case 2:
            
            passToNextVC(IDStr: "idVerificationViewController")
            
        case 3:
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PayOutsVC") as! PayOutsVC
            self.navigationController?.pushViewController(vc, animated: true)
            
//        case 4:
//            
//            passToNextVC(IDStr: "WalletEarningVC")
            
        case 4:
            
            let text = URL(string: self.referalCodeStr)
            let textShare = [text]
            let activityViewController = UIActivityViewController(activityItems: textShare as [Any], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
            
        case 5:
            
            passToNextVC(IDStr: "helpViewController")
            
            
        case 6:
            
            passToNextVC(IDStr: "aboutViewController")
            
        case 7:
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChangeLanguageVC") as! ChangeLanguageVC
            vc.callBack = {
                self.menuList_table_view.reloadData()
            }
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 8:
            
            logoutAlertVc()
            
        case 9:
            
            alertDeleteAccount()
            
        default:
            
            break
            
        }
        
        

    }
    func alertDeleteAccount(){
        
        let alertController = UIAlertController(
            
                  title: "Confirm Delete",
                  message: "Are you sure want to delete account?",
                  preferredStyle: .alert
              )
              
              let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                  
                  self.deleteAccountApi()
                  
              }
              alertController.addAction(okAction)
              
              let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                  
                  self.dismiss(animated: true)
                  
              }
              alertController.addAction(cancelAction)
       
              present(alertController, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
            return 55
        
    }
    
    
}
