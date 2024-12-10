//
//  RequestRecievedViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-2 on 25/11/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit
import WebKit
class RequestRecievedViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var requestWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

       requestWebView.navigationDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        requestRecived()
    }
    
    func requestRecived()  {
        
        let FinalUrl = Request_Recived_url + fethToken()
        
        print(FinalUrl)
        
        requestWebView.load(URLRequest(url: URL(string: FinalUrl)!))
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        showProgressHud(view: self.view)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        dissmissHUD(self.view)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let urlStr = navigationAction.request.url?.absoluteString {
            //urlStr is what you want
            
            print(urlStr)
        }
        
        decisionHandler(.allow)
        
    }

}
