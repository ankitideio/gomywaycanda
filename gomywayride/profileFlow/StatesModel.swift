//
//  StatesModel.swift
//  gomywayride
//
//  Created by Apple on 17/01/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import UIKit

class StatesModel {
    var name:String?
    var id:Int?
    
    init(data:[String:Any]) {
        self.name = data["name"] as? String ?? ""
        self.id = data["id"] as? Int ?? 0
    }
}
