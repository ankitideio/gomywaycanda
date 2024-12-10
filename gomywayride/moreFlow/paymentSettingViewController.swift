//
//  paymentSettingViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 06/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class paymentSettingViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var cardCollection: UICollectionView!
    
    @IBOutlet weak var cvv: FormTextField!
    @IBOutlet weak var year: FormTextField!
    @IBOutlet weak var month: FormTextField!
    @IBOutlet weak var cardType: FormTextField!
    @IBOutlet weak var cardNuber: FormTextField!
    @IBOutlet weak var cardName: FormTextField!
    @IBOutlet weak var scrool_view: UIScrollView!
    @IBOutlet weak var main_view: UIView!
    
    
   
    var cardDetails : CardDetailsModel!
    var cardDetailsArr = [CardDetailsModel]()
    var pickerView = UIPickerView()
    var cardTypeArr = ["Visa","Master Card","American Express","Discover","Capital One"]
    var monthArr = [String]()
    var years = [String]()
    var choosenTxt = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        month.delegate = self
        year.delegate = self
        cardType.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        cardType.inputView = pickerView
        month.inputView = pickerView
        year.inputView = pickerView
        self.title = "Bank Details"
        scrool_view.ShadowColorView()
        showAllMonth()
        getAllYears()
//        getSavedCards()
    }
    
    func showAllMonth()  {
        //let dateFormatter = DateFormatter()
        for months in 1..<13 {
           // print("\(dateFormatter.monthSymbols[months])")
            monthArr.append("\(months)")
        }
    }

    func getAllYears()  {

        for i in (1970..<2040).reversed() {
            years.append("\(i)")
        }
    }
    
//    func deleteCard(idstr:String,index:NSInteger)  {
//        
//        let param = ["token":fethToken(),"id":idstr]
//        
//        APIManager().postDatatoServer(deleteCardAPi_endpoint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            
//            
//            if status == true
//            {
//                
//                self.cardDetailsArr.remove(at: index)
//                
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            
//            self.cardCollection.reloadData()
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//        
//    }
//    
//    func addCardDetails()  {
//        
//        let param = ["token":fethToken(),"card_name":cardName.text!,"card_type":cardType.text!,"month":month.text!,"year":year.text!,"cvv":cvv.text!,"card_number":cardNuber.text!]
//        
//        APIManager().postDatatoServer(AddCardAPi_endpoint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            
//            
//            if status == true
//            {
//                self.cardDetailsArr.removeAll()
//                
//                let dataArr = result?["data"] as? NSArray ?? []
//                
//                for item in dataArr
//                {
//                    self.cardDetails = CardDetailsModel.init(data: item as! [String : Any])
//                    self.cardDetailsArr.append(self.cardDetails)
//                }
//                
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            
//            self.cardCollection.reloadData()
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//    }
//    
//    func getSavedCards()  {
//        
//        let param = ["token":fethToken()]
//        
//        APIManager().postDatatoServer(cardDetailsApi_endpoint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            
//            
//            if status == true
//            {
//                
//                let dataArr = result?["data"] as? NSArray ?? []
//                
//                for item in dataArr
//                {
//                    self.cardDetails = CardDetailsModel.init(data: item as! [String : Any])
//                    self.cardDetailsArr.append(self.cardDetails)
//                }
//                
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            
//            self.cardCollection.reloadData()
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == cardType {
            
            choosenTxt = "cardType"
        }
        else if textField == month
        {
            choosenTxt = "Month"
        }
        else if textField == year
        {
            choosenTxt = "Year"
        }
        
        pickerView.reloadAllComponents()
    }
    
    //MARK:- IBAction

    @IBAction func addAction(_ sender: Any) {
        
        var message = String()
        
        if (cardName.text?.count)! < 1 {
            
            message = "Please enter your card name"
        }
        else if (cardNuber.text?.count)! < 1
        {
            message = "Please enter your card number"
        }
        else if (cardType.text?.count)! < 1
        {
            message = "Please select card type"
        }
        else if (month.text?.count)! < 1
        {
            message = "Please select card expiry month"
        }
        else if (year.text?.count)! < 1
        {
            message = "Please select card expiry year"
        }
        else if (cvv.text?.count)! < 1
        {
            message = "Please enter cvv number"
        }
        
        if message.count > 1 {
            
            TostErrorMessage(view: self.view, message: message)
        }
        else
        {
//            addCardDetails()
        }
    }
    
    @objc func deleteVehicle(sender:UIButton)  {
        
//        deleteCard(idstr: cardDetailsArr[sender.tag].id, index: sender.tag)
    }
    
}
extension paymentSettingViewController: UICollectionViewDelegate,UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardDetailsArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! cardsCollectionCell
        cell.bgView.ShadowWithCorner()
        cell.deleteBtn.tag = indexPath.row
        cell.deleteBtn.addTarget(self, action: #selector(deleteVehicle), for: .touchUpInside)
        cell.cardNo.text = cardDetailsArr[indexPath.row].card_number
        cell.cardName.text = cardDetailsArr[indexPath.row].card_name
        cell.expire.text = "\(cardDetailsArr[indexPath.row].expire_month)/\(cardDetailsArr[indexPath.row].expire_year)"
        cell.cvv.text = "xxxx"
        return cell
        
    }
}
extension paymentSettingViewController:UIPickerViewDataSource,UIPickerViewDelegate
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if choosenTxt == "cardType" {
             return cardTypeArr.count
        }
        else if choosenTxt == "Month"
        {
            return monthArr.count
        }
        else
        {
            return years.count
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if choosenTxt == "cardType" {
            return cardTypeArr[row]
        }
        else if choosenTxt == "Month"
        {
            return monthArr[row]
        }
        else
        {
            return years[row]
        }
    
        
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if choosenTxt == "cardType" {
            self.cardType.text = cardTypeArr[row]
        }
        else if choosenTxt == "Month"
        {
            self.month.text = monthArr[row]
        }
        else
        {
            self.year.text = years[row]
        }
       
        
        
    }
    
 
}
