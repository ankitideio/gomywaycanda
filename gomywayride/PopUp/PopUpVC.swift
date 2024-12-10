//
//  PopUpVC.swift
//  GomywayCanada
//
//  Created by meet sharma on 04/08/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import UIKit

class PopUpVC: UIViewController {
    
    @IBOutlet weak var lblSuccess: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLanguage()
    }
    private func setLanguage(){
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
           
            lblSuccess.text = "success".localizeString(string: "fr-CA")
            lblTitle.text = "bankDetailUpdated".localizeString(string: "fr-CA")
        }else{
            lblSuccess.text = "success".localizeString(string: "en")
            lblTitle.text = "bankDetailUpdated".localizeString(string: "en")
        }
    }

    @IBAction func actionOk(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
