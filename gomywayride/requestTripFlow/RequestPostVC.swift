//
//  RequestPostVC.swift
//  gomywayride
//
//  Created by Apple on 15/12/22.
//  Copyright © 2022 Snow-Macmini-1. All rights reserved.
//

import UIKit
import GooglePlaces
class RequestPostVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var lblDestination: UILabel!
    @IBOutlet weak var lblTotalSeats: UILabel!
    @IBOutlet weak var lblLeaving: UILabel!
    @IBOutlet weak var lblSeatRequired: UILabel!
    @IBOutlet weak var lblOrigin: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtVwDescription: UITextView!
    @IBOutlet weak var btnPostRequst: UIButton!
    @IBOutlet weak var txtFldSeats: UITextField!
    @IBOutlet weak var txtFldLeaving: UITextField!
    @IBOutlet weak var txtFldDestination: UITextField!
    @IBOutlet weak var txtFldOrigion: UITextField!
    @IBOutlet weak var lblSeats: UILabel!
    
    var datePicker = UIDatePicker()
    var selectedTxt = String()
    var pickerVwSeats = UIPickerView()
    var arrSeats = [1,2,3,4,5,6,7]
    var viewModel = PostFindTripVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLanguage()
        txtFldLeaving.delegate = self
        txtFldSeats.delegate = self
        txtFldOrigion.delegate = self
        txtFldSeats.inputView = pickerVwSeats
        txtFldDestination.delegate = self
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(pickedDate), for: .valueChanged)
        datePicker.minimumDate = Date()
        txtFldLeaving.inputView = datePicker
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        
    }
    private func setLanguage(){
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            lblTitle.text = "postRequest".localizeString(string: "fr-CA")
            lblOrigin.text = "origin".localizeString(string: "fr-CA")
            lblDescription.text = "description".localizeString(string: "fr-CA")
            lblLeaving.text = "leaving".localizeString(string: "fr-CA")
            lblSeatRequired.text = "seatRequired".localizeString(string: "fr-CA")
            lblTotalSeats.text = "seats".localizeString(string: "fr-CA")
            lblDestination.text = "destination".localizeString(string: "fr-CA")
            btnPostRequst.setTitle("postRequest".localizeString(string: "fr-CA"), for: .normal)
        }else{
            lblTitle.text = "postRequest".localizeString(string: "en")
            lblOrigin.text = "origin".localizeString(string: "en")
            lblDescription.text = "description".localizeString(string: "en")
            lblLeaving.text = "leaving".localizeString(string: "en")
            lblSeatRequired.text = "seatRequired".localizeString(string: "en")
            lblTotalSeats.text = "seats".localizeString(string: "en")
            lblDestination.text = "destination".localizeString(string: "en")
            btnPostRequst.setTitle("postRequest".localizeString(string: "en"), for: .normal)

        }
    }
    func AutocompleteOpen()  {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        // Specify a filter.
        let filter = GMSAutocompleteFilter()
        filter.country = "CA"
        autocompleteController.autocompleteFilter = filter
        present(autocompleteController, animated: true, completion: nil)
    }
    
    @objc func pickedDate(sender:UIDatePicker)  {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        txtFldLeaving.text = formatter.string(from: datePicker.date)
    }
    
    //MARK:-TestFiedDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == txtFldOrigion {
            selectedTxt = "1"
            AutocompleteOpen()
        }
        else if textField == txtFldDestination
        {
            selectedTxt = "2"
            AutocompleteOpen()
        } else if textField == txtFldSeats{
            pickerVwSeats.dataSource = self
            pickerVwSeats.delegate = self
            pickerVwSeats.reloadAllComponents()
            if txtFldSeats.inputView == pickerVwSeats{
                let row = pickerVwSeats.selectedRow(inComponent: 0)
                lblSeats.text = "\(arrSeats[row])"
            }
        }
    }
    func postRequestApi(){
        viewModel.postRequestApi(origin: txtFldOrigion.text ?? "", destination: txtFldDestination.text ?? "", leaving: txtFldLeaving.text ?? "", seat: lblSeats.text ?? "", description: txtVwDescription.text ?? "") { data in
            let alertController = UIAlertController(title: "Post Request", message: data?.message, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: { vc in
                self.navigationController?.popViewController(animated: true)
            })
               alertController.addAction(OKAction)
               self.present(alertController, animated: true, completion: nil)
        }
            
        
    }
  
    @IBAction func actionDescription(_ sender: Any) {
        
        var messageStr = String()
        
        if (txtFldOrigion.text?.count)! < 1 {
            
            messageStr = "Please select your origion point"
        }
        else if (txtFldDestination.text?.count)! < 1 {
            
            messageStr = "Please select your destination point"
        }else if (txtFldLeaving.text?.count)! < 1 {
            
            messageStr = "Please select date"
        }
        
        if messageStr.count > 1 {
            
            TostErrorMessage(view: self.view, message: messageStr)
        }
        else
        {
            postRequestApi()
        }
        
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension RequestPostVC: GMSAutocompleteViewControllerDelegate
{
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Place name: \(place.name!)")
        selectedTxt == "1" ? (txtFldOrigion.text = place.name!) : (txtFldDestination.text = place.name!)
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

extension RequestPostVC:UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       1
       
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

            return arrSeats.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
            return "\(arrSeats[row])"
        
            
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        lblSeats.text = "\(arrSeats[row])"
        
        
    }
  
}
