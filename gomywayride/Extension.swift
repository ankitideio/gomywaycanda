//
//  Extension.swift
//  GomywayCanada
//
//  Created by meet sharma on 22/08/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
import UIKit

extension String{
    func localizeString(string: String) -> String {
        let path = Bundle.main.path(forResource: string, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
