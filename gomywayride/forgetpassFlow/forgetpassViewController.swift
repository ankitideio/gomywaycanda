//
//  forgetpassViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 05/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class forgetpassViewController: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnSendLink: UIButton!
    @IBOutlet weak var lblEmailAddress: UILabel!
    @IBOutlet weak var lblForgotTitle: UILabel!
    @IBOutlet weak var lblForgotPassword: UILabel!
    @IBOutlet weak var forgotPass: FormTextField!
    
    var viewModel = AuthVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLanguage()
    }
    private func setLanguage(){
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            lblForgotPassword.text = "forgotYourPassword".localizeString(string: "fr-CA")
            lblForgotTitle.text = "forgotPasswordTitle".localizeString(string: "fr-CA")
            lblEmailAddress.text = "emailAddress".localizeString(string: "fr-CA")
            btnSendLink.setTitle("resendLink".localizeString(string: "fr-CA"), for: .normal)
            btnBack.setTitle("back".localizeString(string: "fr-CA"), for: .normal)
        }else{
            lblForgotPassword.text = "forgotYourPassword".localizeString(string: "en")
            lblForgotTitle.text = "forgotPasswordTitle".localizeString(string: "en")
            lblEmailAddress.text = "emailAddress".localizeString(string: "en")
            btnSendLink.setTitle("resendLink".localizeString(string: "en"), for: .normal)
            btnBack.setTitle("back".localizeString(string: "en"), for: .normal)

        }
    }
    
    func forgotPasswordApi(){
        viewModel.forgotPasswordApi(email: forgotPass.text ?? "") { data in
            sucessToast(view: self.view, message: data?.message ?? "")
            
        }
    }
    
    
    
    @IBAction func send_link_btn_Action(_ sender: Any) {
        
        if !isValidEmail(emailStr: forgotPass.text!) {
            TostErrorMessage(view: self.view, message: "Please enter valid email")
        }
        else
        {

            forgotPasswordApi()
        }
    }
    
    @IBAction func back_btn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
