//
//  rideSegmentViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-2 on 29/11/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit
import MXSegmentedPager
class rideSegmentViewController: MXSegmentedPagerController {

    @IBOutlet var headerView: UIView!
    var titleArr = ["UPCOMING","RECENT"]
    override func viewDidLoad() {
        super.viewDidLoad()

         IntaialPopulateData()
    }
    
    override func viewDidLayoutSubviews() {
        
       
    }
    
    func IntaialPopulateData() {
        
        segmentedPager.parallaxHeader.view = headerView
        segmentedPager.parallaxHeader.mode = .fill
        segmentedPager.parallaxHeader.height = 70
        segmentedPager.parallaxHeader.minimumHeight = 70
        //segmentedPager.parallaxHeader.view?.backgroundColor = UIColor.red
        
        segmentedPager.backgroundColor = UIColor.white
        segmentedPager.bounces = false
//        segmentedPager.segmentedControl.selectionIndicatorLocation = .down
//        segmentedPager.segmentedControl.backgroundColor = .white
//        segmentedPager.segmentedControl.borderWidth = 1
//        segmentedPager.segmentedControl.borderType = [.bottom,.top]
//        // segmentedPager.segmentedControlEdgeInsets = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
//        segmentedPager.segmentedControl.borderColor = UIColor(red: 234/255.0, green: 234/255.0, blue: 234/255.0, alpha: 1.0)
//        segmentedPager.segmentedControl.titleTextAttributes = [NSAttributedString.Key.font :UIFont.systemFont(ofSize: 15),NSAttributedString.Key.foregroundColor : UIColor.darkGray]
//        segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(red: 255/255.0, green: 79/255.0, blue: 2/255.0, alpha: 1.0)]
//        segmentedPager.segmentedControl.selectionStyle = .fullWidthStripe
//        segmentedPager.segmentedControl.selectionIndicatorColor = UIColor(red: 255/255.0, green: 79/255.0, blue: 2/255.0, alpha: 1.0)
//        segmentedPager.segmentedControl.selectionIndicatorHeight = 2
        
        
    }
    
    //MARK:- PagerDelegate
    
    override func numberOfPages(in segmentedPager: MXSegmentedPager) -> Int {
        
        return titleArr.count
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, titleForSectionAt index: Int) -> String {
        
        
        return titleArr[index]
        
    }
    
    //MARK:- IBAction
    
    @IBAction func backTap(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
