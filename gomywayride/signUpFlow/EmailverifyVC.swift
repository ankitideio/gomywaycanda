//
//  EmailverifyVC.swift
//  gomywayride
//
//  Created by Prince dhiman on 05/10/22.
//  Copyright © 2022 Snow-Macmini-1. All rights reserved.
//

import UIKit

class EmailverifyVC: UIViewController {


    @IBOutlet weak var widthResendBtn: NSLayoutConstraint!
    @IBOutlet weak var btnResend: UIButton!
    @IBOutlet weak var lblEmailVerification: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblVerifyEmail: UILabel!
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var emailText: UILabel!
    var emailName = ""
    var emailLabel:String = "Email Verification sent successfully to your email! "
    var timer: Timer?
    var newVar = ""
    var idNew = ""
    var viewModel = MoreDetailsVM()
    var viewModelAuth = AuthVM()
    var arrEmailVerify = [GetEmailData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSet()
    }
    func uiSet(){
      
        setLanguage()
        
        startTimer()
    }
    func startTimer(){
           timer?.invalidate()
      
           timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateValueurl), userInfo: nil, repeats: true)
           RunLoop.current.add(timer!, forMode: .common)
       }
    
    @objc func updateValueurl() {
    
        viewModelAuth.emailVerificationApi(token: newVar) { data in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                if data?.user?.emailStatus == "1" {
                    self.stopTimer()
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneverifyVC") as! PhoneverifyVC
                        vc.newVar = data?.user?.token ?? ""
                        vc.idNew = data?.user?.id ?? ""
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }
        }
    }
  
    func stopTimer() {
            timer?.invalidate()
            timer = nil
        }
        
        deinit {
            // Make sure to stop the timer when the view controller is deallocated
            stopTimer()
        }
    private func setLanguage(){
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            
            lblVerifyEmail.text = "verifyEmail".localizeString(string: "fr-CA")
            lblTitle.text = "verifyEmailTitle".localizeString(string: "fr-CA")
            lblEmailVerification.text = "\("emailVerification".localizeString(string: "fr-CA")) \(emailName)"
            btnLogout.setTitle("logout".localizeString(string: "fr-CA"), for: .normal)
            btnResend.setTitle("resendVerification".localizeString(string: "fr-CA"), for: .normal)
            widthResendBtn.constant = 250
        }else{
            lblVerifyEmail.text = "verifyEmail".localizeString(string: "en")
            lblTitle.text = "verifyEmailTitle".localizeString(string: "en")
            lblEmailVerification.text = "\("emailVerification".localizeString(string: "en")) \(emailName)"
            btnLogout.setTitle("logout".localizeString(string: "en"), for: .normal)
            btnResend.setTitle("resendVerification".localizeString(string: "en"), for: .normal)
            widthResendBtn.constant = 180
    
        }
    }
    func resendVerifyApi(){
        viewModelAuth.resendOtpVerification(token: newVar){ data in
            TostErrorMessage(view: self.view, message: data?.message ?? "")
        }
    }
   
    @IBAction func logoutTap(_ sender: Any) {
        self.stopTimer()
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers
        for aViewController in viewControllers {
            if aViewController is ViewController {
                self.navigationController!.popToViewController(aViewController, animated: true)
            }
        }
        
    }
    
    @IBAction func verificationTap(_ sender: Any) {
       resendVerifyApi()
//        resendVerifyApi()
//        let alert = UIAlertController(title: nil, message: "Email Verification sent Sucessfully To Your Email", preferredStyle: .alert)
//
//        let ok = UIAlertAction(title: "OK", style: .default) { (button) in
//        }
//        alert.addAction(ok)
//        self.present(alert, animated: true, completion: nil)
//        let vc = storyboard?.instantiateViewController(withIdentifier: "PhoneverifyVC") as! PhoneverifyVC
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


