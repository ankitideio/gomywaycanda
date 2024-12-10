//
//  CommonUtilities.swift
//  GomywayCanada
//
//  Created by meet sharma on 19/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
import UIKit
import SwiftMessages
class CommonUtilities{
    static let shared = CommonUtilities()
    
    func showAlert(message :String){
        DispatchQueue.main.async
        {
            let alert = UIAlertController(title:"", message: message, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
                DispatchQueue.main.async {
                    alert.dismiss(animated: true, completion: nil)
                }
                
                
            })
            
            alert.addAction(ok)
            
            DispatchQueue.main.async {
                //if let window = UIApplication.shared.keyWindow
                if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first{
                    DispatchQueue.main.async {
                        
                        window.rootViewController!.present(alert, animated: true)
                    }
                }
            }
        }
    }
   
  
    func showToast( message : String) {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first{
                DispatchQueue.main.async {
                    
                    let sender = window.rootViewController!
                    let toastLabel = UILabel(frame: CGRect(x: 20, y: sender.view.frame.size.height-100, width: sender.view.frame.size.width-40, height: 60))
                    toastLabel.backgroundColor = UIColor.black
                    toastLabel.textColor = UIColor.white
                    toastLabel.textAlignment = .center;
                    toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
                    toastLabel.text = message
                    toastLabel.alpha = 1.0
                    toastLabel.layer.cornerRadius = 10;
                    toastLabel.clipsToBounds  =  true
                    sender.view.addSubview(toastLabel)
                    toastLabel.bringSubviewToFront(sender.view)
                    sender.view.bringSubviewToFront(sender.view)
                    UIView.animate(withDuration: 3, delay: 0.3, options: .curveEaseOut, animations: {
                        toastLabel.alpha = 0.0
                    }, completion: {(isCompleted) in
                        toastLabel.removeFromSuperview()
                    })
                }
            }
        }
    }
}
//MARK: POP ON CLICK OF ALERT MESSAGE
func showAlertWithSingleActionPopVC(sender:UIViewController,message:String = "")  {
    let alertController = UIAlertController(title: appName, message: message, preferredStyle: .alert)
    
    // Create the actions
    let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
        UIAlertAction in
        sender.navigationController?.popViewController(animated: true)
    }
    
    alertController.addAction(okAction)
    sender.present(alertController, animated: true, completion: nil)
}

//MARK: SHOW ALERT
func showAlertWithSingleAction(value: Bool,sender:UIViewController,message:String = "")  {
    let alertController = UIAlertController(title: appName, message: message, preferredStyle: .alert)
    // Create the actions
    let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
        UIAlertAction in
       
    }
    alertController.addAction(okAction)
    sender.present(alertController, animated: true, completion: nil)
}

func showSwiftyAlert(_ Title :String,_ body: String ,_ isSuccess : Bool){
    DispatchQueue.main.async {
        let warning = MessageView.viewFromNib(layout: .cardView)
        if isSuccess == true{
            warning.configureTheme(.success)
        }else{
            warning.configureTheme(.error)
        }
        warning.configureDropShadow()
        warning.configureContent(title: Title, body: body)
        warning.button?.isHidden = true
        // warning.iconImageView?.image = #imageLiteral(resourceName: "imgNavLogo")
        var warningConfig = SwiftMessages.defaultConfig
        warningConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        warningConfig.duration = .seconds(seconds: 3)
        SwiftMessages.show(config: warningConfig, view: warning)
    }
}
