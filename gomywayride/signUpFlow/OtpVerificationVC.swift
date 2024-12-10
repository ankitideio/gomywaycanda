//
//  OtpVerificationVC.swift
//  gomywayride
//
//  Created by Prince dhiman on 07/10/22.
//  Copyright © 2022 Snow-Macmini-1. All rights reserved.
//

import UIKit


class OtpVerificationVC: UIViewController {
    
    var window:UIWindow?
    @IBOutlet weak var btnVerify: UIButton!
    @IBOutlet weak var lblReceive: UILabel!
    @IBOutlet weak var btnResendOtp: UIButton!
    @IBOutlet weak var lblOtpTitle: UILabel!
    @IBOutlet weak var lblOtpVerification: UILabel!
    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var thirdText: UITextField!
    @IBOutlet weak var fourthText: UITextField!
    @IBOutlet weak var fifthText: UITextField!
    var newToken = ""
    var reToken = ""
    var newId = ""
    var viewModel = AuthVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstText.addTarget(self, action: #selector(self.textFeildDidEnding(_textFeild:)), for: UIControl.Event.editingChanged)
        secondText.addTarget(self, action: #selector(self.textFeildDidEnding(_textFeild:)), for: UIControl.Event.editingChanged)
        thirdText.addTarget(self, action: #selector(self.textFeildDidEnding(_textFeild:)), for: UIControl.Event.editingChanged)
        fourthText.addTarget(self, action: #selector(self.textFeildDidEnding(_textFeild:)), for: UIControl.Event.editingChanged)
        fifthText.addTarget(self, action: #selector(self.textFeildDidEnding(_textFeild:)), for: UIControl.Event.editingChanged)

        setLanguage()
    }
    private func setLanguage(){
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            lblOtpVerification.text = "verifyOtp".localizeString(string: "fr-CA")
            lblOtpTitle.text = "otpTitle".localizeString(string: "fr-CA")
            lblReceive.text = "receiveOtp".localizeString(string: "fr-CA")
            btnVerify.setTitle("verifyAndProceedOtp".localizeString(string: "fr-CA"), for: .normal)
            btnResendOtp.setTitle("resendOtp".localizeString(string: "fr-CA"), for: .normal)
        }else{
            lblOtpVerification.text = "verifyOtp".localizeString(string: "en")
            lblOtpTitle.text = "otpTitle".localizeString(string: "en")
            lblReceive.text = "receiveOtp".localizeString(string: "en")
            btnVerify.setTitle("verifyAndProceedOtp".localizeString(string: "en"), for: .normal)
            btnResendOtp.setTitle("resendOtp".localizeString(string: "en"), for: .normal)
        
        }
    
    }
    @objc func textFeildDidEnding(_textFeild: UITextField){
        let text = _textFeild.text
        if text?.utf16.count == 1 {
            switch _textFeild {
            case firstText:
                secondText.becomeFirstResponder()
                break
            case secondText:
                thirdText.becomeFirstResponder()
                break
            case thirdText:
                fourthText.becomeFirstResponder()
                break
            case fourthText:
                fifthText.becomeFirstResponder()
                break
            case fifthText:
                firstText.becomeFirstResponder()
                break
            default:
                break
            
            }
        }
    }
    
    @IBAction func backTap(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "PhoneverifyVC") as! PhoneverifyVC
        self.dismiss(animated: true)
    }
    
    
    @IBAction func resendTap(_ sender: Any) {
//       resendCode()
        resendOtpApi()
    }
    
    @IBAction func verifyTap(_ sender: Any) {
       
       verifyCodeApi()
    }
    func verifyCodeApi(){
        viewModel.otpVerification(otp: "\(firstText.text!)\(secondText.text ?? "")\(thirdText.text ?? "")\(fourthText.text ?? "")\(fifthText.text ?? "")", token: newToken) {_ in 
            saveLoginToken(token: self.newToken, userId: self.newId)
        
            self.window = UIWindow(frame: UIScreen.main.bounds)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "homeTab")
            self.window?.rootViewController = initialViewController
            let myTabBar = self.window?.rootViewController as! UITabBarController
            myTabBar.selectedIndex = 2
            self.window?.makeKeyAndVisible()
        }
    }
   
    func resendOtpApi(){
        viewModel.resendOtpVerification(token: reToken) { data in
            sucessToast(view: self.view, message: "Resend OTP send sucessfully")
        }
    }
  
    
}








