//
//  AddEmailPopViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-2 on 22/11/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit


class AddEmailPopViewController: UIViewController {
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var emailTxt: FormTextField!
    
    var viewModel = MoreDetailsVM()
    var callBack:((_ data:[Email]?)->())?
    override func viewDidLoad() {
        super.viewDidLoad()

        bgView.ShadowWithCorner()
    }
    func saveUserEmailApi(){
        viewModel.addUserEmailApi(email: emailTxt.text ?? "") { data in
            self.dismiss(animated: false, completion: nil)
            self.callBack?(data)
//            self.delegate?.passSaveEmail(data: data)
        }
    }
  
    
    //MARK:- IBAction
    
    @IBAction func crossTap(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func addAction(_ sender: Any) {
        
        if !isValidEmail(emailStr: emailTxt.text!) {
            
            TostErrorMessage(view: self.view, message: "Please enter valid email")
        }
        else
        {
            saveUserEmailApi()
        }
    }
    

}
