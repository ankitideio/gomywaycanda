//
//  profileViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 09/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit
import MXSegmentedPager
import HCSStarRatingView
class profileViewController: UIViewController,MXParallaxHeaderDelegate {

    @IBOutlet weak var reviews_lbl: UILabel!
    @IBOutlet weak var aboutLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var shadow_view: UIView!
    @IBOutlet weak var scroll_view: UIScrollView!
    @IBOutlet weak var bg_view: UIView!
    @IBOutlet var header_view: UIView!
    @IBOutlet weak var header_img: UIImageView!
    @IBOutlet weak var ride_table_view: UITableView!
    @IBOutlet weak var upcoming_table_view: UITableView!
    
    @IBOutlet weak var ratingView: UIView!
    let rideArr = ["Joined","Email Address","Phone Number","Government issued ID"]
    let frenchRideArr = ["Rejoint le","Adresse e-mail","Numéro de téléphone","Identificación emitida por el gobierno"]
    let imgArr = [UIImage(named: "user"),UIImage(named: "email"),UIImage(named: "call"),UIImage(named: "id")]
    let verifiedArr = ["Augest 2019","Verfied","Verfied","Unverfied"]
   
    var userDetailsDict = NSDictionary()
    var upcomingTripsaArr = NSArray()
    var viewModel = MoreDetailsVM()
    var userData:UserData?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shadow_view.ShadowColorView()
        scroll_view.parallaxHeader.view = header_view
        scroll_view.parallaxHeader.height = 280
        scroll_view.parallaxHeader.minimumHeight = 0
        scroll_view.parallaxHeader.mode = MXParallaxHeaderMode.fill
        scroll_view.parallaxHeader.delegate = self
        let rightButton = UIBarButtonItem.init(image: UIImage(named: "edit"), style: .plain, target: self, action: #selector(rightButtonAction(sender:)))
        self.navigationItem.rightBarButtonItem = rightButton
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        

        getProfileDataApi()
    }
    
    @objc func rightButtonAction(sender: UIBarButtonItem)
    {
    
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "editPrfileViewController") as! editPrfileViewController
        vc.hidesBottomBarWhenPushed = true
//        vc.userData = getDict()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func ratingAppear(valueStr:Int)  {
        let ratingLabal = HCSStarRatingView()
        ratingLabal.isUserInteractionEnabled = false
        ratingLabal.frame = CGRect(x: 0, y: 0, width: 100, height: 25)
        ratingLabal.maximumValue = 5
        ratingLabal.minimumValue = 0
        ratingLabal.allowsHalfStars = false
        ratingLabal.value = CGFloat(valueStr)
        ratingLabal.filledStarImage = UIImage(named:"filledstar")
        ratingLabal.emptyStarImage = UIImage(named:"empty_star")
        ratingView.addSubview(ratingLabal)
    }
    func getProfileDataApi(){
        viewModel.getProfileApi(status: true) { data in
            
            self.nameLbl.text = "\(data?.user?.firstName ?? "") \(data?.user?.lastName ?? "")"
            self.ageLbl.text = "\(getGender(value: data?.user?.gender ?? "")),\(data?.user?.age ?? 0)"
            self.aboutLbl.text = data?.user?.aboutUser ?? ""
            self.reviews_lbl.text = "Reviews:\(data?.user?.numberOfReviews ?? 0)"
            self.header_img.sd_setImage(with: URL(string: data?.user?.profileImage ?? ""), placeholderImage: UIImage(named: "userAvatar"), options: .refreshCached, context: nil)
            self.userData = data
            self.ratingAppear(valueStr: data?.user?.avgRating ?? 0)
            self.ride_table_view.reloadData()
        }
    }
   
   
}
//MARK: - UITableViewDelegate
extension profileViewController: UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == ride_table_view
        {
            if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
                return frenchRideArr.count
            }else{
                return rideArr.count
            }
        }
        else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == ride_table_view
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! profileTableViewCell
            if indexPath.row == 0{
                cell.widthVerifyTitle.constant = 135
            }else{
                cell.widthVerifyTitle.constant = 80
            }
            cell.icon_img.image = imgArr[indexPath.row]
            if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
                cell.name_lbl.text = frenchRideArr[indexPath.row]
            }else{
                cell.name_lbl.text = rideArr[indexPath.row]
            }
            if indexPath.row == 0
            {
//                let dateJoined = self.userDetailsDict["joined"] as? String ?? ""
                let dateJoined = userData?.user?.joined ?? ""
                
                cell.verfied_lbl.text = dateJoined
                cell.verfied_lbl.textColor = UIColor.black
            }
            else if indexPath.row == 1
            {
                let emailVerified = userData?.user?.emailStatus ?? ""
                emailVerified == "0" ? (cell.verfied_lbl.text = "Unverified") : (cell.verfied_lbl.text = "Verified")
                emailVerified == "0" ? (cell.verfied_lbl.textColor = UIColor(red:255/255, green:79/255, blue:2/255, alpha:1.0)) : (cell.verfied_lbl.textColor = UIColor(red:0.14, green:0.71, blue:0.00, alpha:1.0))
            }
            else if indexPath.row == 2
            {
                let PhoneVerified = userData?.user?.mobileStatus ?? ""
                PhoneVerified == "0" ? (cell.verfied_lbl.text = "Unverified") : (cell.verfied_lbl.text = "Verified")
                PhoneVerified == "0" ? (cell.verfied_lbl.textColor = UIColor(red:255/255, green:79/255, blue:2/255, alpha:1.0)) : (cell.verfied_lbl.textColor = UIColor(red:0.14, green:0.71, blue:0.00, alpha:1.0))
            }
            else if indexPath.row == 3
            {
                let govet = userData?.user?.govermentIssuedID ?? ""
                cell.verfied_lbl.text = govet
                govet == "Unverified" ? (cell.verfied_lbl.textColor = UIColor(red:255/255, green:79/255, blue:2/255, alpha:1.0)) : (cell.verfied_lbl.textColor = UIColor(red:0.14, green:0.71, blue:0.00, alpha:1.0))
            }
            
          
            return cell
        }
        else
        {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! profileTableViewCell1
            
            return cell
        }
     }
    
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == ride_table_view
        {
    
            return 0
        }
        else
        {
          
            return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == ride_table_view
        {
            
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0))
            
            return headerView
        }
        else
        {
           
            
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
            let headerTital = UILabel(frame: CGRect(x: 10, y: 0, width: 200, height: 25))
            headerView.backgroundColor = UIColor.white
            headerTital.font = UIFont(name: "Roboto-Bold", size: 17)
            headerTital.textColor = UIColor.black
            headerTital.text = ""
            headerView.addSubview(headerTital)
            return headerView
        }
       
    }
}
