//
//  TabBarVC.swift
//  GomywayCanada
//
//  Created by meet sharma on 03/08/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController,UITabBarControllerDelegate {
    var centeredButton = UIButton()
    var selectCenter = true
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        setupCenterButton()
        updateTabBarItemsTitles()
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("ChangeLanguage"), object: nil)
       }

    @objc func methodOfReceivedNotification(notification: Notification) {
        updateTabBarItemsTitles()
             
    }
    private func updateTabBarItemsTitles() {
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            
            tabBar.items?[0].title = "more".localizeString(string: "fr-CA")
         
            tabBar.items?[4].title = "profile".localizeString(string: "fr-CA")

            
        }else{
            
            tabBar.items?[0].title = "more".localizeString(string: "en")
            
            tabBar.items?[4].title = "profile".localizeString(string: "en")
        }

       }
    

       private func setupCenterButton() {
           print("SelectIndex\(selectedIndex)")
            centeredButton = UIButton(type: .custom)

           let newImage = UIImage(named: selectCenter == true ? "car-gray 1" : "home1")
            centeredButton.setImage(newImage, for: .normal)
           centeredButton.frame.size = CGSize(width: 48, height: 48)
           centeredButton.layer.cornerRadius = centeredButton.frame.height / 2
           centeredButton.backgroundColor = UIColor.white

           centeredButton.addTarget(self, action: #selector(centeredButtonTapped), for: .touchUpInside)

           let tabBarHeight = tabBar.frame.size.height
           let tabBarWidth = tabBar.frame.size.width

           centeredButton.center = CGPoint(x: tabBarWidth / 2, y: tabBarHeight / 2 ) // Adjust the Y position as needed

           tabBar.addSubview(centeredButton)
       }

    private func updateCenterButtonImage(for selectedIndex: Int) {
       
        let newImage = UIImage(named: selectCenter == true ? "car-gray 1" : "home1")
        self.centeredButton.setImage(newImage, for: .normal)
           
       }
       @objc func centeredButtonTapped() {
           selectCenter = true
           selectedIndex = 2
           updateCenterButtonImage(for: selectedIndex)
     
       }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            selectCenter = false
           updateCenterButtonImage(for: tabBarController.selectedIndex)
        print("SelectIndex\(tabBarController.selectedIndex)")
       }

}


