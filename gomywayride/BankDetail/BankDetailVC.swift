//
//  BankDetailVC.swift
//  GomywayCanada
//
//  Created by meet sharma on 04/08/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import UIKit

class BankDetailVC: UIViewController {
    
    @IBOutlet weak var widthSaveBtn: NSLayoutConstraint!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var lblBankName: UILabel!
    @IBOutlet weak var lblAccountNo: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtFldAccountNumber: UITextField!
    @IBOutlet weak var txtFldBankName: UITextField!
    @IBOutlet weak var txtFldName: UITextField!
    var pickerVwBank = UIPickerView()
    var arrBankList = [BankListModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setLanguage()
        txtFldBankName.delegate = self
        txtFldBankName.inputView = pickerVwBank
        
    }
    private func setLanguage(){
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            self.title = "bankDetail".localizeString(string: "fr-CA")
            lblName.text = "yourName".localizeString(string: "fr-CA")
            lblBankName.text = "bankName".localizeString(string: "fr-CA")
            lblAccountNo.text = "accountNo".localizeString(string: "fr-CA")
            btnSave.setTitle("saveBankDetail".localizeString(string: "fr-CA"), for: .normal)
            widthSaveBtn.constant = 250
           
        }else{
            self.title = "bankDetail".localizeString(string: "en")
            lblName.text = "yourName".localizeString(string: "en")
            lblBankName.text = "bankName".localizeString(string: "en")
            lblAccountNo.text = "accountNo".localizeString(string: "en")
            btnSave.setTitle("saveBankDetail".localizeString(string: "en"), for: .normal)
            widthSaveBtn.constant = 130
      
        }
    }
    
    
   
    @IBAction func actionSave(_ sender: UIButton) {
        
        
    }
    
}

extension BankDetailVC:UIPickerViewDataSource,UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerVwBank{
            return arrBankList.count
        }else{
            return 0
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == pickerVwBank{
            return arrBankList[row].name ?? ""
        }else{
            return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == pickerVwBank{
            txtFldBankName.text =  arrBankList[row].name ?? ""
        }
    }
}
extension BankDetailVC:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == txtFldBankName{
            pickerVwBank.dataSource = self
            pickerVwBank.delegate = self
            pickerVwBank.reloadAllComponents()
            if txtFldBankName.inputView == pickerVwBank{
                let row = pickerVwBank.selectedRow(inComponent:0)
                txtFldBankName.text = arrBankList[row].name ?? ""
                
            }
        }
    }
    
}
