//
//  editPrfileViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-2 on 19/11/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class editPrfileViewController: UIViewController {


    @IBOutlet weak var lblStateName: UILabel!
    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var lblStreetNo: UILabel!
    @IBOutlet weak var lblHouseNo: UILabel!
    @IBOutlet weak var btnUpdateProfile: UIButton!
    @IBOutlet weak var btnAddVehicle: UIButton!
    @IBOutlet weak var lblDateBirth: UILabel!
    @IBOutlet weak var lblAmDriver: UILabel!
    @IBOutlet weak var lblVehicle: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblAbout: UILabel!
    @IBOutlet weak var lblPhoneNo: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblProfileDetail: UILabel!
    @IBOutlet weak var vechCollection: UICollectionView!
    @IBOutlet weak var driverSwitchBnt: UISwitch!
    @IBOutlet weak var sceretxt: FormTextField!
    @IBOutlet weak var otherBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var aboutTxt: UITextView!
    @IBOutlet weak var DobTxt: FormTextField!
    @IBOutlet weak var phoneTxt: FormTextField!
    @IBOutlet weak var Ltxt: FormTextField!
    @IBOutlet weak var Ftext: FormTextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var mainScroll: UIScrollView!
    @IBOutlet weak var txtFldStateName: FormTextField!
    @IBOutlet weak var txtFldCityName: FormTextField!
    @IBOutlet weak var txtFldStreetName: FormTextField!
    @IBOutlet weak var txtFldHouseNo: FormTextField!
    
    var userData = NSDictionary()
    var vehicalData : vehicalDataModel!
    var vehicleModelArr = [vehicalDataModel]()
    var SelectedimageData = Data()
    var datePicker = UIDatePicker()
    var User_type_Str = String()
    var genderStr = String()
    var arrStates = [GetStatesData]()
    var pickerVwState = UIPickerView()
    var viewModel = MoreDetailsVM()
    var arrVehicle = [UserVehicle]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setLanguage()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(pickedDate), for: .valueChanged)
        datePicker.maximumDate = Date()
        DobTxt.inputView = datePicker
        userImage.imageCircle()
        mainScroll.ShadowColorView()
        txtFldStateName.delegate = self
        txtFldStateName.inputView = pickerVwState
        userImage.addTapGestureRecognizer {
            
            self.alertImagePicker()
        }
        driverSwitchBnt.addTarget(self, action: #selector(userTypeSwitch), for: .valueChanged)
        populateData()
        getVehicalApi()
       
            self.getStateApi()
        
      
    }
    
    private func setLanguage(){
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            self.title = "editProfile".localizeString(string: "fr-CA")
            lblProfileDetail.text = "profileDetails".localizeString(string: "fr-CA")
            lblFirstName.text = "firstName".localizeString(string: "fr-CA")
            lblLastName.text = "lastName".localizeString(string: "fr-CA")
            lblPhoneNo.text = "phoneNo".localizeString(string: "fr-CA")
            lblDateBirth.text = "dateOfBirth".localizeString(string: "fr-CA")
            lblHouseNo.text = "houseNo".localizeString(string: "fr-CA")
            lblCityName.text = "cityName".localizeString(string: "fr-CA")
            lblStateName.text = "stateName".localizeString(string: "fr-CA")
            lblStreetNo.text = "streetName".localizeString(string: "fr-CA")
            lblAbout.text = "about".localizeString(string: "fr-CA")
            lblGender.text = "gender".localizeString(string: "fr-CA")
            lblAmDriver.text = "iamDriver".localizeString(string: "fr-CA")
            lblVehicle.text = "vehicle".localizeString(string: "fr-CA")
            maleBtn.setTitle("male".localizeString(string: "fr-CA"), for: .normal)
            femaleBtn.setTitle("female".localizeString(string: "fr-CA"), for: .normal)
            otherBtn.setTitle("others".localizeString(string: "fr-CA"), for: .normal)
            btnUpdateProfile.setTitle("updateProfile".localizeString(string: "fr-CA"), for: .normal)
            btnAddVehicle.setTitle("addVehicle".localizeString(string: "fr-CA"), for: .normal)
        } else {
            
            self.title = "editProfile".localizeString(string: "en")
            lblProfileDetail.text = "profileDetails".localizeString(string: "en")
            lblFirstName.text = "firstName".localizeString(string: "en")
            lblLastName.text = "lastName".localizeString(string: "en")
            lblPhoneNo.text = "phoneNo".localizeString(string: "en")
            lblDateBirth.text = "dateOfBirth".localizeString(string: "en")
            lblHouseNo.text = "houseNo".localizeString(string: "en")
            lblCityName.text = "cityName".localizeString(string: "en")
            lblStateName.text = "stateName".localizeString(string: "en")
            lblStreetNo.text = "streetName".localizeString(string: "en")
            lblAbout.text = "about".localizeString(string: "en")
            lblGender.text = "gender".localizeString(string: "en")
            lblAmDriver.text = "iamDriver".localizeString(string: "en")
            lblVehicle.text = "vehicle".localizeString(string: "en")
            maleBtn.setTitle("male".localizeString(string: "en"), for: .normal)
            femaleBtn.setTitle("female".localizeString(string: "en"), for: .normal)
            otherBtn.setTitle("others".localizeString(string: "en"), for: .normal)
            btnUpdateProfile.setTitle("updateProfile".localizeString(string: "en"), for: .normal)
            btnAddVehicle.setTitle("addVehicle".localizeString(string: "en"), for: .normal)
        }
    }


func getProfileApi(){
    viewModel.getProfileApi(status: false) { data in
        self.Ftext.text = data?.user?.firstName ?? ""
        self.Ltxt.text = data?.user?.lastName ?? ""
        var phone = data?.user?.mobile ?? ""
        phone.removeFirst()
        self.phoneTxt.text = phone
        self.DobTxt.text = data?.user?.date_of_birth ?? ""
        self.aboutTxt.text = data?.user?.aboutUser ?? ""
        //sceretxt.text = userData["paystack_secret"] as? String ?? ""
        self.txtFldHouseNo.text = data?.user?.houseNumber ?? ""
        self.txtFldCityName.text = data?.user?.cityName ?? ""
        self.txtFldStateName.text = data?.user?.stateName ?? ""
        self.txtFldStreetName.text = data?.user?.streetName ?? ""
        self.userImage.sd_setImage(with: URL(string: data?.user?.profileImage ?? ""), placeholderImage: UIImage(named: "userAvatar"), options: .refreshCached, context: nil)
        self.User_type_Str = data?.user?.userType ?? ""
        self.User_type_Str == "0" ? (self.driverSwitchBnt.isOn = false) : (self.driverSwitchBnt.isOn = true)
        if data?.user?.gender == "1" {
            self.maleBtn.setImage(UIImage(named: "circle-dot-regular 1"), for: .normal)
                                  
          }
        else if data?.user?.gender == "2"
          {
             self.femaleBtn.setImage(UIImage(named: "circle-dot-regular 1"), for: .normal)
         }else {
             self.otherBtn.setImage(UIImage(named: "circle-dot-regular 1"), for: .normal)
           }
    }
}
    func populateData()  {
       getProfileApi()
//        Ftext.text = Store.userDetail?.user?.firstName ?? ""
//        Ltxt.text = Store.userDetail?.user?.lastName ?? ""
//        phoneTxt.text = Store.userDetail?.user?.mobile ?? ""
//        DobTxt.text = Store.userDetail?.user?.date_of_birth ?? ""
//        aboutTxt.text = Store.userDetail?.user?.aboutUser ?? ""
//        //sceretxt.text = userData["paystack_secret"] as? String ?? ""
//        txtFldHouseNo.text = Store.userDetail?.user?.houseNumber ?? ""
//        txtFldCityName.text = Store.userDetail?.user?.cityName ?? ""
//        txtFldStateName.text = Store.userDetail?.user?.stateName ?? ""
//        txtFldStreetName.text = Store.userDetail?.user?.streetName ?? ""
//        userImage.sd_setImage(with: URL(string: Store.userDetail?.user?.profileImage ?? ""), placeholderImage: UIImage(named: "userAvatar"), options: .refreshCached, context: nil)
//        genderStr = Store.userDetail?.user?.gender ?? ""
//        Ftext.text = userData["first_name"] as? String ?? ""
//        Ltxt.text = userData["last_name"] as? String ?? ""
//        phoneTxt.text = userData["mobile"] as? String ?? ""
//        DobTxt.text = userData["date_of_birth"] as? String ?? ""
//        aboutTxt.text = userData["about_user"] as? String ?? ""
//        //sceretxt.text = userData["paystack_secret"] as? String ?? ""
//        txtFldHouseNo.text = userData["house_number"] as? String ?? ""
//        txtFldCityName.text = userData["city_name"] as? String ?? ""
//        txtFldStateName.text = userData["state_name"] as? String ?? ""
//        txtFldStreetName.text = userData["street_name"] as? String ?? ""
//        userImage.sd_setImage(with: URL(string: userData["profile_image"] as? String ?? ""), placeholderImage: UIImage(named: "userAvatar"), options: .refreshCached, context: nil)
//        genderStr = userData["gender"] as? String ?? ""
//        User_type_Str = userData["user_type"] as? String ?? ""
//        User_type_Str == "0" ? (driverSwitchBnt.isOn = false) : (driverSwitchBnt.isOn = true)
//        if genderStr == "1" {
//            
//            maleBtn.setImage(UIImage(named: "circle-dot-regular 1"), for: .normal)
//            
//        }
//        else if genderStr == "2"
//        {
//            femaleBtn.setImage(UIImage(named: "circle-dot-regular 1"), for: .normal)
//        }
//        else
//        {
//            otherBtn.setImage(UIImage(named: "circle-dot-regular 1"), for: .normal)
//        }
        
    }
    func getVehicalApi()  {
        viewModel.getVehicalsApi(token: fethToken()) { data in
            self.arrVehicle = data?.userVehicles ?? []
            self.vechCollection.reloadData()
        }
    }
    func getStateApi(){
        viewModel.stateNameApi(token: fethToken()) { data in
            self.arrStates = data ?? []
        }
    }
  
    func deleteVehcileApi(idStr:String,index:NSInteger) {
        viewModel.deleteVehicalsApi(token: fethToken(), vehicleId: idStr) { data in
            self.arrVehicle.remove(at: index)
            self.getVehicalApi()
        }
        
    }
//    func deleteVehcile(idStr:String,index:NSInteger) {
//       
//            let alertController = UIAlertController(title: "", message: "Do you want to delete this vahicle?", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
//                
//                let param = ["token":fethToken(),"vehicleId":idStr]
//                
//                APIManager().postDatatoServer(deleteVehcleApi_endpoint, parameter: param as NSDictionary, success: { (response) in
//                    print(response)
//                    
//                    let result = response.dictionaryObject
//                    let messageStr = result?["message"] as? String ?? ""
//                    let status = result?["status"] as? Bool ?? false
//                    
//                    if status == true
//                    {
//                        
//                        self.vehicleModelArr.remove(at: index)
//                        
//                       
//                    }
//                    else
//                    {
//                        TostErrorMessage(view: self.view, message: messageStr)
//                    }
//                    
//                    self.vechCollection.reloadData()
//                    
//                }) { (error) in
//                    TostErrorMessage(view: self.view, message: error.localizedDescription)
//                }
//                
//            }
//            let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
//                    self.dismiss(animated: true)
//            }
//            alertController.addAction(okAction)
//            alertController.addAction(cancelAction)
//            present(alertController, animated: true, completion: nil)
//        
//            }
    func updateProfileApi()  {
        viewModel.updateProfiel(profilePhoto: SelectedimageData,token: fethToken(),
                                user_type: User_type_Str,
                                first_name: self.Ftext.text ?? "",
                                last_name: self.Ltxt.text ?? "",
                                about_user: self.aboutTxt.text ?? "",
                                gender: self.genderStr ,
                                mobile: self.phoneTxt.text ?? "",
                                date_of_birth: self.DobTxt.text ?? "",
                                house_number: self.txtFldHouseNo.text ?? "",
                                city_name: self.txtFldCityName.text ?? "",
                                state_name: self.txtFldStateName.text ?? "",
                                street_name: self.txtFldStreetName.text ?? "")
        { data in
            
        }
    }
    
    
    //MARK: - ImagePicker
    
    func alertImagePicker()  {
        let imagePickOption = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let galleryBtn = UIAlertAction(title: "Choose Photo", style: .default) { (UIAlertAction) in
            self.ImageOption("photoLibrary")
        }

        let CameraButton = UIAlertAction(title: "Take Photo", style: .default) { (UIAlertAction) in
            self.ImageOption("Camera")
            
        }

        let Cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        imagePickOption.addAction(galleryBtn)
        imagePickOption.addAction(CameraButton)
        imagePickOption.addAction(Cancel)

        // Check if the app is running on iPad before presenting as a popover
        if let popoverPresentationController = imagePickOption.popoverPresentationController {
            popoverPresentationController.sourceView = self.view // Replace with your desired source view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0) // Adjust source rect as needed
            popoverPresentationController.permittedArrowDirections = []
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
    
    @objc func userTypeSwitch(sender:UISwitch)  {
        
        if sender.isOn {
            
            User_type_Str = "1"
        }
        else
        {
             User_type_Str = "0"
        }
    }
    
    @objc func pickedDate(sender:UIDatePicker)  {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        DobTxt.text = formatter.string(from: datePicker.date)
    }
    
    func passVechileData(data: NSDictionary) {
        
        vehicleModelArr.removeAll()
        
        let vechArr = data["userVehicles"] as? NSArray ?? []
        
        for item in vechArr
        {
            self.vehicalData = vehicalDataModel.init(data: item as! [String : Any])
            self.vehicleModelArr.append(self.vehicalData)
        }
        
        self.vechCollection.reloadData()
    }
    
    
    @objc func deleteVehicle(sender:UIButton)  {
              let alertController = UIAlertController(title: "", message: "Do you want to delete this vehicle.", preferredStyle: .alert)
              let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
                  self.deleteVehcileApi(idStr: self.arrVehicle[sender.tag].id ?? "", index: sender.tag)
                  
              }
              let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
                  self.dismiss(animated: false)
              }
              alertController.addAction(okAction)
              alertController.addAction(cancelAction)

              self.present(alertController, animated: true, completion: nil)
        
//        deleteVehcile(idStr: arrVehicle[sender.tag].id ?? "", index: sender.tag)
        
    }
    
    @IBAction func addVehical(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddVehicleViewController") as! AddVehicleViewController
        vc.callBack = {
            self.getVehicalApi()
        }
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func otherAction(_ sender: Any) {
        
        genderStr = "3"
        
        maleBtn.setImage(UIImage(named: "radioUncheck"), for: .normal)
        femaleBtn.setImage(UIImage(named: "radioUncheck"), for: .normal)
        otherBtn.setImage(UIImage(named: "circle-dot-regular 1"), for: .normal)
        
    }
    @IBAction func femaleAction(_ sender: Any) {
        
        genderStr = "2"
        
        maleBtn.setImage(UIImage(named: "radioUncheck"), for: .normal)
        otherBtn.setImage(UIImage(named: "radioUncheck"), for: .normal)
        femaleBtn.setImage(UIImage(named: "circle-dot-regular 1"), for: .normal)
    }
    @IBAction func maleAction(_ sender: Any) {
        
        genderStr = "1"
        
        femaleBtn.setImage(UIImage(named: "radioUncheck"), for: .normal)
        otherBtn.setImage(UIImage(named: "radioUncheck"), for: .normal)
        maleBtn.setImage(UIImage(named: "circle-dot-regular 1"), for: .normal)
    }
    
    @IBAction func updateAction(_ sender: Any) {
        updateProfileApi()
    }
}
extension editPrfileViewController: UICollectionViewDelegate,UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrVehicle.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! vehicleTableCell
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            cell.lblCarInsurance.text = "carInsurance".localizeString(string: "fr-CA")
        }else{
            cell.lblCarInsurance.text = "carInsurance".localizeString(string: "en")
        }
        cell.deleteBtn.tag = indexPath.row
        cell.vehImage.sd_setImage(with: URL(string: arrVehicle[indexPath.row].vehicleImageURL ?? ""), placeholderImage: UIImage(named: "userAvatar"), options: .refreshCached, context: nil)
        cell.imgVwInsurance.sd_setImage(with: URL(string: arrVehicle[indexPath.row].carInsurance ?? ""), placeholderImage: UIImage(named: "userAvatar"), options: .refreshCached, context: nil)
        cell.modelLbl.text = "Vehicle Model: \(arrVehicle[indexPath.row].model ?? "")"
        cell.vehtype.text = "Vehicle Type: \(arrVehicle[indexPath.row].vehicleType ?? "")"
         cell.vehName.text = arrVehicle[indexPath.row].vehicleName ?? ""
        cell.plateNo.text = arrVehicle[indexPath.row].plateNumber
        cell.deleteBtn.addTarget(self, action: #selector(deleteVehicle), for: .touchUpInside)
        return cell
        
    }
}

extension editPrfileViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
   
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
        SelectedimageData = (newImage?.jpeg(.medium))!
        userImage.image = newImage
       
       
    }
}


extension editPrfileViewController:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == txtFldStateName{
            pickerVwState.dataSource = self
            pickerVwState.delegate = self
            pickerVwState.reloadAllComponents()
        if txtFldStateName.inputView == pickerVwState{
                let row = pickerVwState.selectedRow(inComponent:0)
            txtFldStateName.text = arrStates[row].name ?? ""
           
            }
        }
    }
    
}

extension editPrfileViewController:UIPickerViewDataSource,UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       1
       
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerVwState{
            return arrStates.count
        }else{
            return 0
        }
            
      
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
       if pickerView == pickerVwState{
           return arrStates[row].name ?? ""
        }else{
            return ""
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
     if pickerView == pickerVwState{
         txtFldStateName.text =  arrStates[row].name ?? ""
        }
    }
}
