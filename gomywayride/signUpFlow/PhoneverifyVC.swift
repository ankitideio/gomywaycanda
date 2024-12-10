//
//  PhoneverifyVC.swift
//  gomywayride
//
//  Created by Prince dhiman on 06/10/22.
//  Copyright © 2022 Snow-Macmini-1. All rights reserved.
//

import UIKit
import DropDown

class PhoneverifyVC: UIViewController {
    var dropd = DropDown()
    @IBOutlet weak var codeText: UILabel!
    @IBOutlet weak var mobileTextFeild: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func sendCodeTap(_ sender: Any) {
    }
    

    @IBAction func dropDownTap(_ sender: Any) {
        dropd.show()
        dropd.anchorView = codeText
        dropd.dataSource = ["+91","+92","+81","+1","+63"]
        dropd.selectionAction = {[unowned self](Index:Int,item:String) in
            self.codeText.text = item
            dropd.hide()
        }
    }
}
