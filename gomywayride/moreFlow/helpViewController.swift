//
//  helpViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 06/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class helpViewController: UIViewController {

    @IBOutlet weak var table_view: UITableView!
    
    var helpArr = NSArray()
    var viewModel = MoreDetailsVM()
    var arrHelp = [[String:Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        helpDataApi()
        
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
       
            self.title = "help".localizeString(string: "fr-CA")
        }else{
            self.title = "help".localizeString(string: "en")
           
        }
        table_view.ShadowColorView()
        
        table_view.tableFooterView = UIView(frame: .zero)

      
    }
    func helpDataApi()  {
        
        viewModel.helpApi { data in
            self.arrHelp.removeAll()
                for helpData in data ?? []{
                    
                    if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
                        self.arrHelp.append(["title":helpData.title_franch ?? "","description": helpData.description_franch ?? ""])
                    }else{
                        self.arrHelp.append(["title":helpData.title ?? "","description": helpData.description ?? ""])
                    }
                 
                    
                    self.table_view.reloadData()
                }
            
            
        }
    }
   
}
extension helpViewController : UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrHelp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! helptableViewCell
      
            let helpData = arrHelp[indexPath.row]
            let titleStr = helpData["title"] as? String ?? ""
            let descStr = helpData["description"] as? String ?? ""
            
            cell.tital_lbl.text = "\u{2022} \(titleStr)".stripOutHtml()
            
            cell.descLabl.text = descStr.stripOutHtml()
        
        return cell
        
    }


    
}
