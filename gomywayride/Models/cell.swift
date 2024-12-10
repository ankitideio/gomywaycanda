//
//  File.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 06/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import Foundation
import UIKit
class moreTableViewcell: UITableViewCell {
    @IBOutlet weak var name_lbl: UILabel!
    
    @IBOutlet weak var topLablLayout: NSLayoutConstraint!
    @IBOutlet weak var referbtn: UIButton!
    @IBOutlet weak var offerBtn: UIButton!
    @IBOutlet weak var moreBtn: UIButton!
}
class helptableViewCell: UITableViewCell
{
    @IBOutlet weak var tital_lbl: UILabel!
    
    @IBOutlet weak var descLabl: UILabel!
}

class profileTableViewCell : UITableViewCell
{
    @IBOutlet weak var icon_img: UIImageView!
    @IBOutlet weak var name_lbl: UILabel!
    @IBOutlet weak var verfied_lbl: UILabel!
    @IBOutlet weak var widthVerifyTitle: NSLayoutConstraint!
    
}
class profileTableViewCell1 : UITableViewCell
{
    @IBOutlet weak var user_img: UIImageView!
    @IBOutlet weak var name_lbl: UILabel!
    @IBOutlet weak var time_lbl: UILabel!
    @IBOutlet weak var set_lbl: UILabel!
    
}
class requestSettingTableViewCell :UITableViewCell
{
    @IBOutlet weak var request_lbl: UILabel!
}

class postTripTableCell: UITableViewCell {
    
    @IBOutlet weak var lblAbout: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var continuBtn: UIButton!
    @IBOutlet weak var title_lbl: UILabel!
}

class searchTableCell: UITableViewCell {
    @IBOutlet weak var destinationlbl: UIButton!
    @IBOutlet weak var iteminage: UIImageView!
    @IBOutlet weak var name_lbl: UILabel!
    @IBOutlet weak var price_lbl: UILabel!
    @IBOutlet weak var ratingView: UIView!
    
    @IBOutlet weak var review_lbl: UILabel!
    @IBOutlet weak var source_lbl: UIButton!
    @IBOutlet weak var seat_left: UILabel!
    @IBOutlet weak var bgview: UIView!
    @IBOutlet weak var date_lbl: UILabel!
    @IBOutlet weak var details_lbl: UILabel!
}

class vehicleTableCell: UICollectionViewCell {
    
    @IBOutlet weak var plateNo: UILabel!
    @IBOutlet weak var imgVwInsurance: UIImageView!
    @IBOutlet weak var vehtype: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var vehName: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var lblCarInsurance: UILabel!
    @IBOutlet weak var vehImage: UIImageView!
}

class offerTableCell: UITableViewCell {
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var Title_lbl: UILabel!
    
    @IBOutlet weak var copyBtn: UIButton!
    @IBOutlet weak var voucher_lbl: UILabel!
    @IBOutlet weak var bgView: UIView!
}

class rewardTableCell: UITableViewCell {
    
    @IBOutlet weak var Title_lbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var pointLbl: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
}

class payoutTableCell: UITableViewCell {
    
    @IBOutlet weak var deslbl: UIButton!
    @IBOutlet weak var source_lbl: UIButton!
    @IBOutlet weak var point_lbl: UILabel!
    @IBOutlet weak var name_lbl: UILabel!
    @IBOutlet weak var date_lbl: UILabel!
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var nuberLbl: UILabel!
    @IBOutlet weak var taxLbl: UILabel!
}

class cardsCollectionCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var cvv: UILabel!
    @IBOutlet weak var expire: UILabel!
    @IBOutlet weak var cardNo: UILabel!
    @IBOutlet weak var cardType: UILabel!
    @IBOutlet weak var cardName: UILabel!
}

class emailVerificationCell: UITableViewCell {
    @IBOutlet weak var tiltle_lbl: UILabel!
    @IBOutlet weak var email_lbl: UILabel!
    @IBOutlet weak var verify_lbl: UILabel!
    @IBOutlet weak var primary_btn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var widthAddEmailBtn: NSLayoutConstraint!
    
    @IBOutlet weak var resend_btn: UIButton!
}

class UpcomingTableCell: UITableViewCell {
    @IBOutlet weak var destination_lbl: UIButton!
    
    @IBOutlet weak var detailsBtn: UIButton!
    @IBOutlet weak var bhView: UIView!
    @IBOutlet weak var seatNeed_lbl: UILabel!
    @IBOutlet weak var available_seat: UILabel!
    
    @IBOutlet weak var matches_lbl: UILabel!
    @IBOutlet weak var source_lbl: UIButton!
   
    @IBOutlet weak var Date_lbl: UILabel!
}

class RecentTableCell: UITableViewCell {
    @IBOutlet weak var available_lbl: UILabel!
    @IBOutlet weak var source_lbl: UIButton!
    @IBOutlet weak var destination_lbl: UIButton!
    
    @IBOutlet weak var btnDetail: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnViewDetail: UIButton!
    @IBOutlet weak var trip_status: UILabel!
    @IBOutlet weak var bhView: UIView!
    @IBOutlet weak var seatNeed_lbl: UILabel!
    @IBOutlet weak var matches_labl: UILabel!
    @IBOutlet weak var date_lbl: UILabel!
}

class savedSearchTableCell: UITableViewCell {
    
    @IBOutlet weak var searchTitle_lbl: UILabel!
    @IBOutlet weak var totalCount_lblal: UILabel!
}


class chatNotifcationTableCell: UITableViewCell {
    
    @IBOutlet weak var time_lbl: UILabel!
    @IBOutlet weak var message_lbl: UILabel!
    @IBOutlet weak var name_lbl: UILabel!
    @IBOutlet weak var userImage: UIImageView!
}

class chatlistingTableCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var count_lbl: UILabel!
    
    @IBOutlet weak var time_lbl: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var userName: UILabel!
}
