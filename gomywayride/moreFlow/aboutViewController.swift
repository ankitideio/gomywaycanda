//
//  aboutViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 06/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit
import WebKit
class aboutViewController: UIViewController,WKNavigationDelegate {

    
    @IBOutlet weak var aboutWebView: WKWebView!
    
    var viewModel = MoreDetailsVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            self.title = "about".localizeString(string: "fr-CA")
        }else{
            self.title = "about".localizeString(string: "en")
          
        }
         aboutWebView.navigationDelegate = self

        aboutDataApi()
    }
    
    
    //MARK:- WKWebDelegate
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        showProgressHud(view: self.view)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        dissmissHUD(self.view)
    }
    func aboutDataApi()  {
        viewModel.getAboutApi{ data in
            if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
                self.aboutWebView.loadHTMLString(data?.description_franch ?? "", baseURL: nil)
            }else{
                self.aboutWebView.loadHTMLString(data?.description ?? "", baseURL: nil)
              
            }
            
        }
    }
  

}
