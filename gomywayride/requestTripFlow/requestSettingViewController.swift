//
//  requestSettingViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 10/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class requestSettingViewController: UIViewController {
    @IBOutlet weak var table_view_list: UITableView!
    
    let requestArr = ["Edit Request","Share Request","Post New Request","delete Request"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func back_btn_Action(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}
extension requestSettingViewController: UITableViewDataSource,UITableViewDelegate
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requestArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! requestSettingTableViewCell
        cell.request_lbl.text = requestArr[indexPath.row]
        return cell
    }
    
    
    
    
}
