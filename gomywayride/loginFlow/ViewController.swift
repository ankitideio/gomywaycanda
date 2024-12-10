//
//  ViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 05/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegisterHere: UIButton!
    @IBOutlet weak var lblAlreadyAccount: UILabel!
    @IBOutlet weak var btnRememberME: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var checkbtn: UIButton!
    @IBOutlet weak var passwordTxt: FormTextField!
    @IBOutlet weak var emailtxt: FormTextField!
    
    
    var isRememeberLogin = false
    var viewModel = AuthVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setLanguage()
        
    }
    private func setLanguage(){
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            lblLogin.text = "login".localizeString(string: "fr-CA")
            lblUserName.text = "userName".localizeString(string: "fr-CA")
            lblPassword.text = "password".localizeString(string: "fr-CA")
            lblAlreadyAccount.text = "alreadyAccount".localizeString(string: "fr-CA")
            btnRememberME.setTitle("rememberMe".localizeString(string: "fr-CA"), for: .normal)
            btnForgotPassword.setTitle("forgotPassword".localizeString(string: "fr-CA"), for: .normal)
            btnRegisterHere.setTitle("registerHere".localizeString(string: "fr-CA"), for: .normal)
            btnLogin.setTitle("login".localizeString(string: "fr-CA"), for: .normal)
        } else {
            lblLogin.text = "login".localizeString(string: "en")
            lblUserName.text = "userName".localizeString(string: "en")
            lblPassword.text = "password".localizeString(string: "en")
            lblAlreadyAccount.text = "alreadyAccount".localizeString(string: "en")
            btnRememberME.setTitle("rememberMe".localizeString(string: "en"), for: .normal)
            btnForgotPassword.setTitle("forgotPassword".localizeString(string: "en"), for: .normal)
            btnRegisterHere.setTitle("registerHere".localizeString(string: "en"), for: .normal)
            btnLogin.setTitle("login".localizeString(string: "en"), for: .normal)
 
        }
       
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if fetchSavedEmail().isEmpty == false {
            
            emailtxt.text = fetchSavedEmail()
            passwordTxt.text = fetchSavedPassword()
             checkbtn.setImage(UIImage(named: "Frame 5"), for: .normal)
            isRememeberLogin = true
            
        }
    }
    
    func loginApi(){
        viewModel.apiLogin(email: emailtxt.text ?? "", password: passwordTxt.text ?? "") { data in
           
            if data?.user?.emailStatus ?? "0" == "0"{
                let vc = self.storyboard?.instantiateViewController(identifier: "EmailverifyVC") as! EmailverifyVC
                vc.newVar = data?.user?.token ?? ""
                vc.idNew = data?.user?.id ?? ""
                vc.emailName = data?.user?.email ?? ""
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                if data?.user?.mobileStatus == "0"{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneverifyVC") as! PhoneverifyVC
                    vc.newVar = data?.user?.token ?? ""
                    vc.idNew = data?.user?.id ?? ""
                    self.navigationController?.pushViewController(vc, animated: true)
                }else{
                    self.isRememeberLogin == true ? saveEmailAndPassword(email: self.emailtxt.text!, pass: self.passwordTxt.text!) : removeRemember()
                    saveLoginToken(token: data?.user?.token ?? "", userId: data?.user?.id ?? "")
                    Store.userDetail = data
                    Store.authKey = data?.user?.token ?? ""
                    self.MakeToRootVc(IdStr: "homeTab")
                }
            }
           
        }
    }
   
  
    //MARK: - ABAction
    
    
    @IBAction func forgetPass_btn_Action(_ sender: Any) {
        
        passToNextVC(IDStr: "forgetpassViewController")
    }
    
    
    @IBAction func fbaction(_ sender: Any) {
    }
    
    
    @IBAction func googleAction(_ sender: Any) {
    }
    
    @IBAction func checkAction(_ sender: Any) {
        
        if checkbtn.currentImage == UIImage(named: "uncheckWithCorner") {
            
            checkbtn.setImage(UIImage(named: "Frame 5"), for: .normal)
            
            isRememeberLogin = true
        }
        else
        {
            checkbtn.setImage(UIImage(named: "uncheckWithCorner"), for: .normal)
            
            isRememeberLogin  = false
        }
    }
    
    
    @IBAction func login_btn_Action(_ sender: Any) {
        
        var message = String()
        
        if (emailtxt.text?.count)! < 1 {
            
            message = "Please enter your email/username."
        }
        else if (emailtxt.text?.count)! < 1
        {
             message = "Please enter your password"
        }
        
        if message.count > 1 {
            
            TostErrorMessage(view: self.view, message: message)
        }
        else
        {
//            login()
            loginApi()
        }
       
    }
    @IBAction func register_btn_Action(_ sender: Any) {
        passToNextVC(IDStr: "signUpViewController")
        
    }
    
}

