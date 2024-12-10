//
//  BankListModel.swift
//  GomywayCanada
//
//  Created by meet sharma on 04/08/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
import UIKit

class BankListModel {
    var name:String?
    
    init(data:[String:Any]) {
        self.name = data["name"] as? String ?? ""

    }
}
