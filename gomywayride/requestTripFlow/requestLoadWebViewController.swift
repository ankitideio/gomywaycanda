//
//  requestLoadWebViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-2 on 11/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit
import WebKit
class requestLoadWebViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var navTitle_lbl: UILabel!
    
    var isEditTrip = false
    var userID = String()
    var isTripDetails = false
    var trip_id = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        
        if isEditTrip == true {
            if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
      
                navTitle_lbl.text = "editTrip".localizeString(string: "fr-CA")
            }else{
                navTitle_lbl.text = "editTrip".localizeString(string: "en")
            }
//            navTitle_lbl.text = "Edit Trip"
            
            let FinalUrl = EDIT_POST_TRIP_URL + fethToken() + "&id=\(userID)"
            
            print(FinalUrl)
            
            webView.load(URLRequest(url: URL(string: FinalUrl)!))
        }
           
        else if isTripDetails == true
        {
            if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
                
                navTitle_lbl.text = "tripDetails".localizeString(string: "fr-CA")
            }else{
                navTitle_lbl.text = "tripDetails".localizeString(string: "en")
            }
//            navTitle_lbl.text = "Trip Details"
        
            
            let FinalUrl = SEARCHED_TRIP_DETAILS + fethToken() + "&id=\(trip_id)"
            
            print(FinalUrl)
            
            webView.load(URLRequest(url: URL(string: FinalUrl)!))
        }
        else
        {
            if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
                navTitle_lbl.text = "postTrip".localizeString(string: "fr-CA")
            }else{
                navTitle_lbl.text = "postTrip".localizeString(string: "en")
            
            }
            let FinalUrl = POST_TRIP_URL + fethToken()
            
            print(FinalUrl)
            
            webView.load(URLRequest(url: URL(string: FinalUrl)!))
        }
    }
    
    //MARK:- WKWebDelegate
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        showProgressHud(view: self.view)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        dissmissHUD(self.view)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let urlStr = navigationAction.request.url?.absoluteString {
            //urlStr is what you want
            print("select url----",urlStr)
            if urlStr.contains("https://api.whatsapp.com/send?phone") {
                if let phoneNumber = extractPhoneNumber(from: urlStr) {
                    print("whtsappUrl:- \(urlStr)")
                    print("WhatsApp Mobile Number: \(phoneNumber)")
                    
                }
                navigateToWhatsApp()
            }
            let tripSucess = TRIP_SUBMIT_SUCCESSFULLY + fethToken()
            let requestrecieved = Request_Recived_url + fethToken()
            
            
            if tripSucess == urlStr || requestrecieved == urlStr
            
            {
                self.MakeToRootVc(IdStr: "homeTab")
                decisionHandler(.cancel)
            }
            else
            {
                decisionHandler(.allow)
            }
            
        }
        
        
        
    }
    func extractPhoneNumber(from whatsappURL: String) -> String? {
        if let url = URL(string: whatsappURL) {
            if let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems {
                for queryItem in queryItems {
                    if queryItem.name == "phone" {
                        if let phoneNumber = queryItem.value {
                            return phoneNumber
                        }
                    }
                }
            }
        }
        return nil
    }
    func navigateToWhatsApp() {
        let urlString = "https://api.whatsapp.com/send?phone"

        let urlStringEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

        let URL = NSURL(string: urlStringEncoded!)

        if UIApplication.shared.canOpenURL(URL! as URL) {
            debugPrint("opening Whatsapp")
            UIApplication.shared.open(URL as! URL, options: [:]) { status in
                debugPrint("Opened WhatsApp Chat")
            }
        } else {
            debugPrint("Can't open")
        }
    }
    
    //MARK:- IBAction
    
    @IBAction func backTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
