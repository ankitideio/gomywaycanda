//
//  TermConditionVC.swift
//  GomywayCanada
//
//  Created by meet sharma on 18/08/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import UIKit
import WebKit

class TermConditionVC: UIViewController,WKUIDelegate {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var webVw: WKWebView!
    
    var isComing = false
    var viewModel = AuthVM()
    override func viewDidLoad() {
        super.viewDidLoad()

       uiSet()
       
    }
    func uiSet(){
        if isComing == true{
            if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
                lblTitle.text = "terms".localizeString(string: "fr-CA")
            }else{
                lblTitle.text = "terms".localizeString(string: "en")
            }

            TermsApi()
        }else{
            if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
                lblTitle.text = "privacy".localizeString(string: "fr-CA")
            }else{
              
                lblTitle.text = "privacy".localizeString(string: "en")
            }

            privacyApi()
        }
    }
    func TermsApi(){
        viewModel.termApi { data in
            let text = data?.description ?? ""
          
            self.webVw.uiDelegate = self
                  if let baseURL = URL(string: "about:blank") {
                      self.webVw.loadHTMLString(text, baseURL: baseURL)
                  }
              
            print("Success")
        }
    }
    func privacyApi(){
        viewModel.privacyApi { data in
            let text = data?.description ?? ""
          
            self.webVw.uiDelegate = self
                  if let baseURL = URL(string: "about:blank") {
                      self.webVw.loadHTMLString(text, baseURL: baseURL)
                  }
              
            print("Success")
        }
        
        
    }
   
   
    
  
    @IBAction func actionCross(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
