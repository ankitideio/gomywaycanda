//
//  Store.swift
//  GomywayCanada
//
//  Created by meet sharma on 19/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
import UIKit

class Store {
   
    
    class var autoLogin: Bool{
        set{
            Store.saveValue(newValue, .autoLogin)
        }get{
            return Store.getValue(.autoLogin) as? Bool ?? false
        }
    }
        class var userDetail: AuthData? {
            set{
                Store.saveUserDetails(newValue, .userDetail)
            }
            get{
                return Store.getUserDetails(.userDetail)
            }
        }
    class var emailStatus: Bool? {
        set{
            Store.saveUserDetails(newValue, .emailStatus)
        }
        get{
            return Store.getUserDetails(.emailStatus)
        }
    }
    class var userProfileStatus: Bool? {
        set{
            Store.saveUserDetails(newValue, .userProfileStatus)
        }
        get{
            return Store.getUserDetails(.userProfileStatus)
        }
    }
    class var authKey: String?{
        set{
            Store.saveValue(newValue, .authKey)
        }get{
            return Store.getValue(.authKey) as? String
        }
    }
  
    class var fullName: String?{
        set{
            Store.saveValue(newValue, .fullName)
        }get{
            return Store.getValue(.fullName) as? String
        }
    }
    class var deviceToken: String?{
        set{
            Store.saveValue(newValue, .deviceToken)
        }
        get{
            return Store.getValue(.deviceToken) as? String
        }
    }
   
   
    static var remove: DefaultKeys!{
        didSet{
            Store.removeKey(remove)
        }
    }
    
    //MARK:-  Private Functions
    
    private class func removeKey(_ key: DefaultKeys){
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        if key == .userDetails{
            UserDefaults.standard.removeObject(forKey: DefaultKeys.authKey.rawValue)
        }
        UserDefaults.standard.synchronize()
    }
    
    private class func saveValue(_ value: Any? ,_ key:DefaultKeys){
        var data: Data?
        if let value = value{
//            data = NSKeyedArchiver.archivedData(withRootObject: value)
            data = try? NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: true)
        }
        UserDefaults.standard.set(data, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    
 
    
    private class func saveUserDetails<T: Codable>(_ value: T?, _ key: DefaultKeys){
        var data: Data?
        if let value = value{
            data = try? PropertyListEncoder().encode(value)
        }
        Store.saveValue(data, key)
    }
    
    private class func getUserDetails<T: Codable>(_ key: DefaultKeys) -> T?{
        if let data = self.getValue(key) as? Data{
            let loginModel = try? PropertyListDecoder().decode(T.self, from: data)
            return loginModel
        }
        return nil
    }
    
    private class func getValue(_ key: DefaultKeys) -> Any{
        if let data = UserDefaults.standard.value(forKey: key.rawValue) as? Data{
            if let value = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
            {
                return value
            }
            else{
                return ""
            }
        }else{
            return ""
        }
    }
}


