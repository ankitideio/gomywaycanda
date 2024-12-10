//
//  AppDelegate.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 05/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import GoogleMaps
import GooglePlaces
import UserNotifications
import SDWebImage

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {

    var window: UIWindow?
    var deviceTokenStr = String()
  //  let shared = UIApplication.shared.delegate as! AppDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        Thread.sleep(forTimeInterval: 3.0)
        // Tab Bar Color
//        UITabBar.appearance().tintColor = UIColor(red:1.00, green:0.31, blue:0.01, alpha:1.0)
//        //Navigation Bar Color
//        UINavigationBar.appearance().barTintColor = .white
//        UINavigationBar.appearance().isTranslucent = false
//       UIApplication.shared.statusBarView?.backgroundColor = UIColor(red:1.00, green:0.31, blue:0.01, alpha:1.0)
       // let BarButtonItemAppearance = UIBarButtonItem.appearance()
       // BarButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        GMSServices.provideAPIKey(KGoogleApi_Key)
        GMSPlacesClient.provideAPIKey(KGoogleApi_Key)
        checkUserExist()
        registerForRemoteNotification()
        return true
    }
    
    func registerForRemoteNotification() {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
                [weak self] (granted, error) in
                print("Permission granted: \(granted)")
                guard granted else {
                    self?.showPermissionAlert()
                    return
                }
                self?.getNotificationSettings()
            }
        } else {
            // Fallback on earlier versions
            let settings = UIUserNotificationSettings(types: [.alert, .sound, .badge], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
    @available(iOS 10.0, *)
    func getNotificationSettings() {
        
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async {
                UNUserNotificationCenter.current().delegate = self
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    func showPermissionAlert() {
        let alert = UIAlertController(title: "WARNING", message: "Please enable access to Notifications in the Settings app.", preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) {[weak self] (alertAction) in
            self?.gotoAppSettings()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        DispatchQueue.main.async {
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    private func gotoAppSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.openURL(settingsUrl)
            if #available(iOS 10.0, *) {
                getNotificationSettings()
            } else {
                // Fallback on earlier versions
                let settings = UIUserNotificationSettings(types: [.alert, .sound, .badge], categories: nil)
                UIApplication.shared.registerUserNotificationSettings(settings)
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Convert token to string
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print("APNs device token: \(deviceTokenString)")
        deviceTokenStr = deviceTokenString
        
        
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("APNs registration failed: \(error)")
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        
        print("didReceiveRemoteNotification \(userInfo)")
        if let dict = userInfo["aps"]  as? [String: Any] {
            let notificationInfo = userInfo as NSDictionary
            let nortifivation_data = notificationInfo.value(forKey: "aps") as? Dictionary ?? [:]
            
            print(nortifivation_data)
            
        }
    
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        let userInfo = notification.request.content.userInfo
        let notificationInfo = userInfo as NSDictionary
        print(notificationInfo)
        let nortifivation_data = notificationInfo["aps"] as? NSDictionary ?? [:]
        print(nortifivation_data)

        NotificationCenter.default.post(name: Notification.Name("PUSHNOTIFICATION"), object: nil, userInfo: nortifivation_data as? [AnyHashable : Any])
        completionHandler([.alert])
    }
    
   
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        let notificationInfo = userInfo as NSDictionary
        let nortifivation_data = notificationInfo.value(forKey: "aps") as? Dictionary ?? [:]
        
        print(nortifivation_data)
    }
    //MARK: CheckUserstatus
    
    func checkUserExist()  {
                
                let Isregistered = UserDefaults.standard.value(forKey: "token") as? String ?? ""
                
                if Isregistered.isEmpty != true {
                    
                    self.window = UIWindow(frame: UIScreen.main.bounds)
        
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
                    let initialViewController = storyboard.instantiateViewController(withIdentifier: "homeTab")
                    self.window?.rootViewController = initialViewController
                    let myTabBar = self.window?.rootViewController as! UITabBarController
                    myTabBar.selectedIndex = 2
                    self.window?.makeKeyAndVisible()
                   
                }else{
                    
                    self.window = UIWindow(frame: UIScreen.main.bounds)
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let initialViewController = storyboard.instantiateViewController(withIdentifier: "navLogin")
                    
                    self.window?.rootViewController = initialViewController
                    self.window?.makeKeyAndVisible()

        }
        
    }
    
    func emailVerifyRoot(){
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = mainStoryBoard.instantiateViewController(withIdentifier: "EmailverifyVC") as! EmailverifyVC
        
        nextVC.timer = nil
        let nav = UINavigationController.init(rootViewController: nextVC)
        nav.isNavigationBarHidden = true
        UIApplication.shared.windows.first?.rootViewController = nav
        
    }
    func phoneVerifyRoot(){
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = mainStoryBoard.instantiateViewController(withIdentifier: "PhoneverifyVC") as! PhoneverifyVC
        let nav = UINavigationController.init(rootViewController: nextVC)
        nav.isNavigationBarHidden = true
        UIApplication.shared.windows.first?.rootViewController = nav
        
    }
    func homeRoot(){
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = mainStoryBoard.instantiateViewController(withIdentifier: "homeTab") as! TabBarVC
        let nav = UINavigationController.init(rootViewController: nextVC)
        nav.isNavigationBarHidden = true
        UIApplication.shared.windows.first?.rootViewController = nav
        
    }
    
    func logout()  {
        
         removeToken()
        Store.userDetail = nil
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "navLogin")
        
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}
