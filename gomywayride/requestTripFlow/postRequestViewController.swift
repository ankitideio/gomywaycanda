//
//  postRequestViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 10/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit
import GooglePlaces
class postRequestViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var toTxt: UITextField!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var search_table: UITableView!
    @IBOutlet weak var leavingTxt: UITextField!
    @IBOutlet weak var formTxt: UITextField!
    @IBOutlet weak var scroll_view: UIScrollView!
    
    var savedLocArr = NSArray()
    var datePicker = UIDatePicker()
    var selectedTxt = String()
    var arrSearchRide = [SearchRideData]()
    var viewModel = SearchRideVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        scroll_view.ShadowColorView()
        setLanguage()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(pickedDate), for: .valueChanged)
        leavingTxt.inputView = datePicker
        
//        toTxt.setLeftTxtImage(imageName:"marker")
//        leavingTxt.setLeftTxtImage(imageName:"calender")
//        formTxt.setLeftTxtImage(imageName:"markerBlue")
        toTxt.setupRightImage(imageName: "marker")
        leavingTxt.setupRightImage(imageName: "calender")
        formTxt.setupRightImage(imageName: "markerBlue")
        toTxt.textfieldBoarder()
        leavingTxt.textfieldBoarder()
        formTxt.textfieldBoarder()
  
        search_table.tableFooterView = UIView(frame: .zero)
        
        getSavedPlacesApi()
    }
    private func setLanguage(){
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
           
            lblTitle.text = "findTrip".localizeString(string: "fr-CA")
            btnSearch.setTitle("search".localizeString(string: "fr-CA"), for: .normal)
        }else{
            lblTitle.text = "findTrip".localizeString(string: "en")
            btnSearch.setTitle("search".localizeString(string: "en"), for: .normal)
        }
    }
    func getSavedPlacesApi()  {
        
        viewModel.getSavedApi(token: fethToken()) { data in
            
            self.arrSearchRide = data ?? []
            
            self.search_table.reloadData()
            
        }
    }
    
    //PICkerOpen
    
    func AutocompleteOpen()  {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        // Specify a filter.
        let filter = GMSAutocompleteFilter()
        filter.country = "CA"
        autocompleteController.autocompleteFilter = filter
        present(autocompleteController, animated: true, completion: nil)
    }
    
    //MARK:-TestFiedDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == formTxt {
            selectedTxt = "1"
            AutocompleteOpen()
        }
        else if textField == toTxt
        {
            selectedTxt = "2"
            AutocompleteOpen()
        }
    }
    
    //MARK: - IBAction
    
    @objc func pickedDate(sender:UIDatePicker)  {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        leavingTxt.text = formatter.string(from: datePicker.date)
    }
    
    @IBAction func post_request_btn_Action(_ sender: Any) {
        
        var messageStr = String()
        
        if (formTxt.text?.count)! < 1 {
            
            messageStr = "Please select your source point"
        }
        else if (toTxt.text?.count)! < 1 {
            
            messageStr = "Please select your destination point"
        }
        
        if messageStr.count > 1 {
            
            TostErrorMessage(view: self.view, message: messageStr)
        }
        else
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "searchAllViewController") as! searchAllViewController
            vc.sourcePoint = formTxt.text ?? ""
            vc.destionationPoint = toTxt.text ?? ""
            vc.dateStr = leavingTxt.text ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @IBAction func back_btn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
extension postRequestViewController: UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSearchRide.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! savedSearchTableCell
        
        
        
        if indexPath.row == 0 {
            
            cell.totalCount_lblal.text = "Recent Searches(\(arrSearchRide.count))"
        }
        else
        {
             cell.totalCount_lblal.text = nil
        }
        
        let orgin = arrSearchRide[indexPath.row].origin ?? ""
        let destination = arrSearchRide[indexPath.row].destination ?? ""
        
        cell.searchTitle_lbl.text = "\(orgin) To \(destination)"
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let orgin = arrSearchRide[indexPath.row].origin ?? ""
        let destination = arrSearchRide[indexPath.row].destination ?? ""
        self.formTxt.text = orgin
        self.toTxt.text = destination
        
    }
}

extension postRequestViewController: GMSAutocompleteViewControllerDelegate
{
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Place name: \(place.name!)")
        selectedTxt == "1" ? (formTxt.text = place.name!) : (toTxt.text = place.name!)
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}
