//
//  requestDetailViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 10/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class requestDetailViewController: UIViewController {

    @IBOutlet weak var scroll_view: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll_view.ShadowColorView()
    
    }
    
    @IBAction func setting_btn_Action(_ sender: Any) {
        passToNextVC(IDStr: "requestSettingViewController")
    }
    
    @IBAction func back_btn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
