//
//  APIDataModel.swift
//  ideeleePlus
//
//  Created by Snow-Macmini-1 on 10/07/19.
//  Copyright © 2019 Snow-Macmini-2. All rights reserved.
//

import Foundation

//MARK:- FbDataModal
struct fbDataStruct {
    var nameStr = String()
    var emailStr = String()
    var imageUrlStr = String()
    var IDStr = String()
    var gender = String()
    
    init(fbData:[String :Any]) {
        
        self.emailStr = fbData ["email"] as? String ?? ""
        self.nameStr = fbData ["name"] as? String ?? ""
        self.IDStr = fbData ["id"] as? String ?? ""
        let picture = fbData ["picture"] as! NSDictionary
        let pictureData = picture ["data"] as! NSDictionary
        self.imageUrlStr = pictureData ["url"] as? String ?? ""
        self.gender = fbData ["gender"] as? String ?? ""
    }
    
}

class vehicalDataModel {
    
    var user_id = String()
    var plate_number = String()
    var id = String()
    var vehicle_type_id = String()
    var vehicle_type = String()
    var vehicle_image_url = String()
    var car_insurance = String()
    var vehicle_url = String()
    var model = String()
    var vehicle_user_id = String()
    var vehicle_name = String()
    var vehicle_id = String()
    var vehicle_url_path = String()
    
    init(data:[String:Any]) {
        self.user_id = data["user_id"] as? String ?? ""
         self.plate_number = data["plate_number"] as? String ?? ""
         self.id = data["id"] as? String ?? ""
         self.vehicle_type_id = data["vehicle_type_id"] as? String ?? ""
         self.vehicle_type = data["vehicle_type"] as? String ?? ""
         self.vehicle_image_url = data["vehicle_image_url"] as? String ?? ""
        self.car_insurance = data["car_insurance"] as? String ?? ""
         self.vehicle_url = data["vehicle_url"] as? String ?? ""
         self.model = data["model"] as? String ?? ""
         self.vehicle_user_id = data["vehicle_user_id"] as? String ?? ""
         self.vehicle_name = data["vehicle_name"] as? String ?? ""
        self.vehicle_id = data["vehicle_id"] as? String ?? ""
        self.vehicle_url_path = data["vehicle_url_path"] as? String ?? ""
    }
    
    
}

class CardDetailsModel {
    var id = String()
    var user_id = String()
    var card_name = String()
    var card_type = String()
    var card_number = String()
    var expire_month = String()
    var cvv = String()
    var expire_year = String()
    
    init(data:[String:Any]) {
         self.id = data["id"] as? String ?? ""
        self.user_id = data["user_id"] as? String ?? ""
        self.card_name = data["card_name"] as? String ?? ""
        self.card_type = data["card_type"] as? String ?? ""
        self.card_number = data["card_number"] as? String ?? ""
        self.expire_month = data["expire_month"] as? String ?? ""
        self.cvv = data["cvv"] as? String ?? ""
        self.expire_year = data["expire_year"] as? String ?? ""
        
    }
}

class emailDetailsModel {
    var email = String()
    var Verifystatus = String()
    
    init(data:[String:Any]) {
        self.email = data["email"] as? String ?? ""
         self.Verifystatus = data["status"] as? String ?? ""
    }
}

class UpcomingTripDataModel {
    
    var leaving = String()
    var available_seats = String()
    var pending_seats = String()
    var destination = String()
    var origin = String()
    var bookings = Int()
    var trip_id = String()
    
    init(data:[String:Any]) {
        self.leaving = data["leaving"] as? String ?? ""
        self.available_seats = data["available_seats"] as? String ?? ""
        self.pending_seats = data["pending_seats"] as? String ?? ""
        self.destination = data["destination"] as? String ?? ""
        self.origin = data["origin"] as? String ?? ""
        self.trip_id = data["trip_id"] as? String ?? ""
        self.bookings = data["bookings"] as? Int ?? 0
    }
    
}
class RecentTripDataModel {
    
    var leaving = String()
    var available_seats = String()
    var pending_seats = String()
    var destination = String()
    var origin = String()
    var bookings = Int()
    var trip_id = String()
    var trip_status = String()
    var price_per_seat = String()
    var profile_url = String()
    var seats_booked = String()
    var driverLast = String()
    var driverFirst = String()
    
    init(data:[String:Any]) {
        self.leaving = data["leaving"] as? String ?? ""
        self.available_seats = data["available_seats"] as? String ?? ""
        self.pending_seats = data["pending_seats"] as? String ?? ""
        self.trip_id = data["trip_id"] as? String ?? ""
        self.destination = data["destination"] as? String ?? ""
        self.origin = data["origin"] as? String ?? ""
        self.trip_status = data["trip_status"] as? String ?? ""
        self.bookings = data["bookings"] as? Int ?? 0
        self.price_per_seat = data["price_per_seat"] as? String ?? ""
        self.profile_url = data["profile_url"] as? String ?? ""
        self.seats_booked = data["seats_booked"] as? String ?? ""
        self.driverLast = data["driverLast"] as? String ?? ""
        self.driverFirst = data["driverFirst"] as? String ?? ""
    }
    
}
//ChatModal

class chatDataModal {
    var message = String()
    var to_id = String()
    var time = String()
    var toUser_firstName = String()
    var toUser_lastName = String()
    var from_id = String()
    
    init(data:[String:Any]) {
       self.message = data["message"] as? String ?? ""
        self.to_id = data["to_id"] as? String ?? ""
        self.time = data["time"] as? String ?? ""
        self.toUser_firstName = data["toUser_firstName"] as? String ?? ""
        self.toUser_lastName = data["toUser_lastName"] as? String ?? ""
        self.from_id = data["from_id"] as? String ?? ""
        
    }
    
}
