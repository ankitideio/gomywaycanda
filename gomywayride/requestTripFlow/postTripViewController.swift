//
//  postTripViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 10/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class postTripViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    var titleLblArr = ["Post a Trip","Find a Ride","Post a Request"]
    var ImageArr = [UIImage(named: "driverIcon"),UIImage(named: "passenger"),UIImage(named: "passenger")]
    var arrAbout = ["You're driving and have empty seats in your car you're looking to fill.","Find a trip as a passenger.","You're looking for a ride and would like to get notified when one is posted."]
    var titleLblFrenchArr = ["Après le voyage","Trouver un manège","Publier une demande"]
    var arrAboutFrench = ["Vous conduisez et avez des sièges vides dans votre voiture que vous cherchez à remplir.","Trouver un voyage en tant que passager.","Vous êtes à la recherche d’un trajet et souhaitez être averti lorsque celui-ci est affiché."]
    
    var viewModel = MoreDetailsVM()
    var viewModelTrip = FindTripVM()
    var profileStatus = 0
    var tripId = "0"
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    override func viewWillAppear(_ animated: Bool) {
        getProfiledataApi()
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            self.lblTitle.text = "postOrRequestTrip".localizeString(string: "fr-CA")
        }else{
            self.lblTitle.text = "postOrRequestTrip".localizeString(string: "en")
        }
    }
    func getProfiledataApi(){
        viewModel.getProfileApi(status: false) { data in
            self.profileStatus = data?.user?.profileStatus ?? 0
//            self.tripId = data?.upcomingTrips?[0].tripID ?? ""
            
        }
    }
   
    //MARK: - IBACtion
    func getTripRequestStatusApi()  {
//        viewModelTrip.getTripRequestStatusApi(token: fethToken(), tripId: tripId) { data in
            
//            self.passToNextVC(IDStr: "requestLoadWebViewController")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "requestLoadWebViewController") as! requestLoadWebViewController
           
        self.navigationController?.pushViewController(vc, animated: true)
//        }
    }

    

    @IBAction func back_btn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func continueTap(sender:UIButton)  {
        if self.profileStatus == 1{
            if sender.tag == 0 {
                getTripRequestStatusApi()
            }else if sender.tag == 1{
                passToNextVC(IDStr: "postRequestViewController")
            }else{
                passToNextVC(IDStr: "RequestPostVC")
                 
            }
        }else{
            TostErrorMessage(view: self.view, message: "Please complete your profile")
        }
        
    }

}


extension postTripViewController: UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
     
            return titleLblFrenchArr.count
        }else{
            return titleLblArr.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! postTripTableCell
        cell.continuBtn.tag = indexPath.row
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            cell.title_lbl.text = titleLblFrenchArr[indexPath.row]
            cell.lblAbout.text = arrAboutFrench[indexPath.row]
            cell.continuBtn.setTitle("continue".localizeString(string: "fr-CA"), for: .normal)
        }else{
            cell.title_lbl.text = titleLblArr[indexPath.row]
            cell.lblAbout.text = arrAbout[indexPath.row]
            cell.continuBtn.setTitle("continue".localizeString(string: "en"), for: .normal)
           
        }
        
        cell.itemImage.image = ImageArr[indexPath.row]

        cell.continuBtn.addTarget(self, action: #selector(continueTap), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Store.userDetail?.user?.profileStatus ?? "" != "1"{
            TostErrorMessage(view: self.view, message: "Please complete your profile.")
            
        }else{
            if indexPath.row == 0 {
                getTripRequestStatusApi()
            }else if indexPath.row == 1{
                passToNextVC(IDStr: "postRequestViewController")
            }else{
                passToNextVC(IDStr: "RequestPostVC")
            }
        }
       
    }
    
}
