//
//  Utilis.swift
//  Frie
//
//  Created by Snow-Macmini-2 on 05/02/19.
//  Copyright © 2019 Snow-Macmini-2. All rights reserved.
//

import Foundation
import Toast_Swift
import UIKit

    
    func isInterNetConnected() -> Bool {
        
        let interNetreachable = Reachability .forInternetConnection()
        
        let networkstatus:NetworkStatus = (interNetreachable?.currentReachabilityStatus())!
        
        switch networkstatus {
            
        case NotReachable:
            
            return false
            
        case ReachableViaWiFi:
            
            return true
            
        case ReachableViaWWAN:
            
            return true
            
        default:
            
            return true
            
        }
    }
    

var appDelegate = UIApplication.shared.delegate as! AppDelegate


func showProgressHud(view:UIView)  {
    
    let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
    loadingNotification?.mode = .indeterminate
    loadingNotification?.color = UIColor .clear
    loadingNotification?.activityIndicatorColor = UIColor.black
}
func dissmissHUD(_ view:UIView)  {
    
    MBProgressHUD.hideAllHUDs(for: view, animated: true)
}
func InternetErrorToast(view:UIView,message:String)  {
    var style = ToastStyle()
    style.backgroundColor = UIColor.red
    style.cornerRadius = 5
    view.makeToast( message, duration: 3.0, position: .top,style: style)
}

func alertshow(message:String,title:String,view:UIViewController,sucess:@escaping (String) -> Void )  {
    
    let alertVc = UIAlertController (title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    
    alertVc .addAction(UIAlertAction(title: "OK", style: .default, handler: { (Action) in
        
        sucess("Yo")
    }))
    
    view.present(alertVc, animated: true, completion: nil)
}
func TostErrorMessage(view:UIView,message:String)  {
    
    var style = ToastStyle()
    style.backgroundColor = UIColor.red
    style.cornerRadius = 5
    view.makeToast( message, duration: 3.0, position: .top,style: style)
}

func sucessToast(view:UIView,message:String)  {
    var style = ToastStyle()
    style.backgroundColor = UIColor.black
    style.cornerRadius = 5
    view.makeToast( message, duration: 3.0, position: .top,style: style)
}

////////SaveTextFieldCrednetails

func saveEmailAndPassword(email:String,pass:String)  {
    
    let desultsCredendetails = UserDefaults.standard
    desultsCredendetails.set(email, forKey: "SavedEmail")
    desultsCredendetails.set(pass, forKey: "SavedPassword")
    desultsCredendetails.synchronize()
}

func fetchSavedEmail() -> String {
    
    return UserDefaults.standard.value(forKey: "SavedEmail") as? String ?? ""
}

func fetchSavedPassword() -> String {
    return UserDefaults.standard.value(forKey: "SavedPassword") as? String ?? ""
}

func saveTripStatus(tripStatus:Int)  {
    UserDefaults.standard.set(tripStatus, forKey: "tripStatus") as? Int ?? 1
}

func getTripStatus() -> Int {
    return UserDefaults.standard.object(forKey: "tripStatus") as! Int
}

func saveTripStateStatus(tripStateStatus:Int)  {
    UserDefaults.standard.set(tripStateStatus, forKey: "tripStateStatus") as? Int ?? 1
}

func getTripStateStatus() -> Int {
    return UserDefaults.standard.object(forKey: "tripStateStatus") as! Int
}

func removeRemember()  {
    UserDefaults.standard.removeObject(forKey: "SavedEmail")
    UserDefaults.standard.removeObject(forKey: "SavedPassword")
}

extension UILabel
{
    func circleLabal()  {
        self.layer.cornerRadius = self.frame.width/2
        self.layer.masksToBounds = true
    }
}

////SaveLoginData

//public func setDict(dict: NSDictionary) {
//    let data = NSKeyedArchiver.archivedData(withRootObject: dict)
//    let userDefaults = UserDefaults.standard
//    userDefaults.set(data, forKey:"userData")
//}
//
//
//public func getDict() -> NSDictionary {
//    let data = UserDefaults.standard.object(forKey: "userData") as! NSData
//    let object = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as! NSDictionary
//    return object;
//}

func saveLoginToken(token:String,userId:String)  {
    
    let desultsCredendetails = UserDefaults.standard
    desultsCredendetails.set(token, forKey: "token")
    desultsCredendetails.set(userId, forKey: "id")
    desultsCredendetails.synchronize()
}

func fethToken() -> String {
    
    return UserDefaults.standard.value(forKey: "token") as? String ?? ""
}


func fetchUserId() -> String {
    return UserDefaults.standard.value(forKey: "id") as? String ?? ""
}

func removeToken()  {
    UserDefaults.standard.removeObject(forKey: "token")
     UserDefaults.standard.removeObject(forKey: "id")
}
func getGender(value:String) -> String {
    var gender = String()
    switch value {
    case "1":
        gender = "Male"
    case "2":
        gender = "Female"
    default:
        gender = "Other"
    }
    
    return gender
}
extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}

func getLogguage(value:String) -> String {
    var messageStr = String()
    switch value {
    case "0":
        messageStr = "No Luggage"
    case "1":
        messageStr = "Medium Luggage"
        
    case "2":
        messageStr = "Large Luggage"
    default:
        messageStr = "No Luggage"
    }
    
    return messageStr
}

func getBackSeatNumber(value:String) -> String {
    
    var messageStr = String()
    switch value {
    case "0":
        messageStr = "Max two people in the back"
    case "1":
        messageStr = "Three People in the back"
    
    default:
        messageStr = "Occupied"
    }
    
    return messageStr
}

func getTripStaus(ststus:String) -> String
{
    var messagestr = String()
    
    switch ststus {
    case "0":
        messagestr = "Trip Open"
    case "1":
        messagestr = "Trip Closed"
    case "2":
        messagestr = "Trip Completed"
    case "3":
        messagestr = "Trip Cancelled"
    default:
        messagestr = "Trip Closed"
    }
    
    return messagestr
}

func getRideStatus(status:String) -> String {
    var messagestr = String()
    
    switch status {
    case "0":
        messagestr = "Pending"
    case "1":
        messagestr = "Accepted"
    case "2":
        messagestr = "Rejected"
    case "3":
        messagestr = "Completed"
    case "4":
        messagestr = "Expired"
    case "5":
        messagestr = "Cancel by passenger"
    default:
        messagestr = "Expired"
    }
    
    return messagestr
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
}

var KGoogleApi_Key = "AIzaSyBvnYPa4tw9s5TSGwzePeWD4Kk7yulyy9c"


extension UIButton {
    
    func makeMultiLineSupport() {
        guard let titleLabel = titleLabel else {
            return
        }
        titleLabel.numberOfLines = 0
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        titleLabel.setContentHuggingPriority(.required, for: .horizontal)
        addConstraints([
            .init(item: titleLabel,
                  attribute: .top,
                  relatedBy: .greaterThanOrEqual,
                  toItem: self,
                  attribute: .top,
                  multiplier: 1.0,
                  constant: contentEdgeInsets.top),
            .init(item: titleLabel,
                  attribute: .bottom,
                  relatedBy: .greaterThanOrEqual,
                  toItem: self,
                  attribute: .bottom,
                  multiplier: 1.0,
                  constant: contentEdgeInsets.bottom),
            .init(item: titleLabel,
                  attribute: .left,
                  relatedBy: .greaterThanOrEqual,
                  toItem: self,
                  attribute: .left,
                  multiplier: 1.0,
                  constant: contentEdgeInsets.left),
            .init(item: titleLabel,
                  attribute: .right,
                  relatedBy: .greaterThanOrEqual,
                  toItem: self,
                  attribute: .right,
                  multiplier: 1.0,
                  constant: contentEdgeInsets.right)
            ])
    }
    
}

extension UITextField{
    
    
    @IBInspectable var paddingLeftCustom: CGFloat {
         get {
             return leftView!.frame.size.width
         }
         set {
             let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
             leftView = paddingView
             leftViewMode = .always
         }
     }

     @IBInspectable var paddingRightCustom: CGFloat {
         get {
             return rightView!.frame.size.width
         }
         set {
             let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
             rightView = paddingView
             rightViewMode = .always
         }
     }
  
    func setupRightImage(imageName:String){
      let imageView = UIImageView(frame: CGRect(x: 5, y: 12, width: 15, height: 15))
      imageView.image = UIImage(named: imageName)
      let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 40))
      imageContainerView.addSubview(imageView)
      leftView = imageContainerView
      leftViewMode = .always
      self.tintColor = .lightGray
  }
}
