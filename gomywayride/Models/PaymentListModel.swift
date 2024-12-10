//
//  PaymentListModel.swift
//  GomywayCanada
//
//  Created by meet sharma on 07/08/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
import UIKit

class PaymentListModel {
    var first_name:String?
    var last_name:String?
    var origin:String?
    var destination:String?
    var total_amount:String?
    var payment_status:String?
    var leaving:String?
    
    init(data:[String:Any]) {
        self.first_name = data["first_name"] as? String ?? ""
        self.last_name = data["last_name"] as? String ?? ""
        self.origin = data["origin"] as? String ?? ""
        self.destination = data["destination"] as? String ?? ""
        self.total_amount = data["total_amount"] as? String ?? ""
        self.payment_status = data["payment_status"] as? String ?? ""
        self.leaving = data["leaving"] as? String ?? ""
    }
}
