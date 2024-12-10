//
//  AddVehicleViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-2 on 19/11/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit
import BottomPopup



class AddVehicleViewController: BottomPopupViewController,UITextFieldDelegate
{

    @IBOutlet weak var lblInsuranceImg: UILabel!
    @IBOutlet weak var imgVwInsurance: UIImageView!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnUploadPhoto: UIButton!
    @IBOutlet weak var lblPlateNumber: UILabel!
    @IBOutlet weak var lblVehicleImage: UILabel!
    @IBOutlet weak var lblVehicleModel: UILabel!
    @IBOutlet weak var lblVehicleType: UILabel!
    @IBOutlet weak var lblSelectVehicle: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imageVehical: UIImageView!
    @IBOutlet weak var plateTxt: FormTextField!
    @IBOutlet weak var modaltxt: FormTextField!
    @IBOutlet weak var typeTxt: FormTextField!
    @IBOutlet weak var vehicalTxt: FormTextField!
    
  
    var SelectedInsuranceimageData = Data()
    var vehicleTypeArr = NSArray()
    var vehcileArr = NSArray()
    var pickerView = UIPickerView()
    var isTexField = String()
    var SelectedimageData = Data()
    var vechicleId = String()
    var vehicleTypeId = String()
    var selectInsurance = false
    var viewModel = MoreDetailsVM()
    var arrGetVehicles = [Vehicle]()
    var arrGetVehicleType = [VehicleType]()
    var callBack:(()->())?
    var govtId = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        getVehicleApi()
        typeTxt.delegate = self
        vehicalTxt.delegate = self
        
       pickerView.delegate = self
        pickerView.dataSource = self
        vehicalTxt.inputView = pickerView
        typeTxt.inputView = pickerView
        setLanguage()

       
    }
    private func setLanguage(){
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            
            lblTitle.text = "addVehicle".localizeString(string: "fr-CA")
            lblSelectVehicle.text = "selectVehicle".localizeString(string: "fr-CA")
            lblVehicleType.text = "vehicleType".localizeString(string: "fr-CA")
            lblVehicleModel.text = "vehicleModel".localizeString(string: "fr-CA")
            lblPlateNumber.text = "plateNumber".localizeString(string: "fr-CA")
            lblVehicleImage.text = "vehicleImage".localizeString(string: "fr-CA")
            btnSubmit.setTitle("submit".localizeString(string: "fr-CA"), for: .normal)
            lblInsuranceImg.text = "insuranceImage".localizeString(string: "fr-CA")
        }else{
            lblTitle.text = "addVehicle".localizeString(string: "en")
            lblSelectVehicle.text = "selectVehicle".localizeString(string: "en")
            lblVehicleType.text = "vehicleType".localizeString(string: "en")
            lblVehicleModel.text = "vehicleModel".localizeString(string: "en")
            lblPlateNumber.text = "plateNumber".localizeString(string: "en")
            lblVehicleImage.text = "vehicleImage".localizeString(string: "en")
            btnSubmit.setTitle("submit".localizeString(string: "en"), for: .normal)
            lblInsuranceImg.text = "insuranceImage".localizeString(string: "en")
        }
    }
    override func viewDidLayoutSubviews() {
        
        imageVehical.addDashedBorder()
        imgVwInsurance.addDashedBorder()
    }
//
//     func getPopupHeight() -> CGFloat {
//        return UIScreen.main.bounds.size.height
//    }
    func getVehicleApi(){
        viewModel.getVehicalTypeApi(token: fethToken()) { data in
            self.arrGetVehicles = data?.vehicles ?? []
            self.arrGetVehicleType = data?.vehicleTypes ?? []
            self.pickerView.reloadAllComponents()
        }
    }
   
    func submitVehcleDetailsApi(){
        if Store.userDetail?.user?.govermentIssuedID == "Unverified"{
            
            showSwiftyAlert("","Goverment issued id not verified.", false)
            
        }else{
            
            let imgVehicle = (imageVehical.image?.jpegData(compressionQuality: 0.25))
            let imgIdProof = (imgVwInsurance.image?.jpegData(compressionQuality: 0.25))
            viewModel.addVehicalApi(token: fethToken(), vehicle_name: vechicleId, vehicle_type: vehicleTypeId, model: modaltxt.text ?? "", plate_number: plateTxt.text ?? "",img: imgVehicle ?? Data(),idPhoto: imgIdProof ?? Data()) { data in
                
                self.dismiss(animated: true, completion: nil)
                self.callBack?()

            }
        }
       
    }
    
    
    //MARK: - Uitextfielddelgate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       
        if textField == vehicalTxt {
            
            isTexField = "1"
            pickerView.reloadAllComponents()
        }
        else if textField == typeTxt
        {
            isTexField = "2"
            pickerView.reloadAllComponents()
        }
       
        
    }
    //MARK: - ImagePicker
    
    func alertImagePicker() {
        let imagePickOption = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let galleryBtn = UIAlertAction(title: "Choose Photo", style: .default) { (_) in
            self.ImageOption("photoLibrary")
        }

        let CameraButton = UIAlertAction(title: "Take Photo", style: .default) { (_) in
            self.ImageOption("Camera")
        }

        let Cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        imagePickOption.addAction(galleryBtn)
        imagePickOption.addAction(CameraButton)
        imagePickOption.addAction(Cancel)

        if let popoverController = imagePickOption.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        }

        self.present(imagePickOption, animated: true, completion: nil)
    }
    func ImageOption(_ type:String)
    {
        let imagePickerController = UIImagePickerController()
        
        if type == "Camera"
        {
            imagePickerController.sourceType = .camera
            imagePickerController.allowsEditing = true
        }
        else
        {
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = true
        }
        
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: - IBAction

    @IBAction func submitBnt(_ sender: Any) {
        
        var message = String()
        
        if (vehicalTxt.text?.count)! < 1 {
            
            message = "Please select vehicle."
        }
        else if (typeTxt.text?.count)! < 1
        {
            message = "Please select vehicle type"
        }
        else if (modaltxt.text?.count)! < 1
        {
            message = "Please enter vehicle model"
        }
        else if (plateTxt.text?.count)! < 1
        {
            message = "Please enter vehicle plate number"
        }
        else if SelectedimageData.isEmpty
        {
            message = "Please upload vehicle picture"
            
        }else if SelectedInsuranceimageData.isEmpty
        {
            message = "Please upload insurance picture"
        }
        
        if message.count > 1 {
            
            TostErrorMessage(view: self.view, message: message)
        }
        else
        {
//            submitVehcleDetails()
            submitVehcleDetailsApi()
        }
    }
    @IBAction func actionUploadInsurance(_ sender: UIButton) {
        selectInsurance = true
        alertImagePicker()
    }
    @IBAction func uploadBtn(_ sender: Any) {
        selectInsurance = false
        alertImagePicker()
    }
}

extension AddVehicleViewController:UIPickerViewDataSource,UIPickerViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if isTexField == "1" {
            
            return arrGetVehicles.count
            
        }
        else
        {
            return arrGetVehicleType.count
        }
        
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if isTexField == "1" {
            
           return arrGetVehicles[row].vehicleName ?? ""
            
        }
        else
        {
             return arrGetVehicleType[row].vehicleType ?? ""
        }
        
       
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if isTexField == "1" {
            
            self.vehicalTxt.text = arrGetVehicles[row].vehicleName ?? ""
            
            vechicleId = arrGetVehicles[row].id ?? ""
        }
        else
        {
            self.typeTxt.text = arrGetVehicleType[row].vehicleType ?? ""
            
            vehicleTypeId = arrGetVehicleType[row].id ?? ""
            
        }
        
    }
    
    //ImagePickerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        self .dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        guard  let choosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            print("No image found")
            return
        }
        
        let newImage =
        choosenImage.fixOrientation()
        if selectInsurance == true{
            SelectedInsuranceimageData = (newImage?.jpeg(.medium))!
            imgVwInsurance.image = newImage
        }else{
            SelectedimageData = (newImage?.jpeg(.medium))!
            imageVehical.image = newImage
        }
    }
}

