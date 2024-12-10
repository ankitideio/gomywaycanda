//
//  idVerificationViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 06/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class idVerificationViewController: UIViewController {

    @IBOutlet weak var widthSubmitBtn: NSLayoutConstraint!
    @IBOutlet weak var btnUploadPhoto: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var lblIdDestroyed: UILabel!
    @IBOutlet weak var lblUploadTitle: UILabel!
    @IBOutlet weak var lblTitleSecond: UILabel!
    @IBOutlet weak var lblTitleFirst: UILabel!
    @IBOutlet weak var lblVerificationTitle: UILabel!
    @IBOutlet weak var lNameTxt: FormTextField!
    @IBOutlet weak var FnameTxt: FormTextField!
    @IBOutlet weak var idImage: UIImageView!
    @IBOutlet weak var main_view: UIView!
    @IBOutlet weak var scroll_view: UIScrollView!
    @IBOutlet weak var uplode_img: UIImageView!
    
    @IBOutlet weak var checkImage: UIImageView!
    var SelectedimageData = Data()
    var viewModel = MoreDetailsVM()
    var IdVerfication: IdVerficationData?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ID Verfication"
        scroll_view.ShadowColorView()
        setLanguage()

        fetchIdentityApi()
        print(fethToken())
    }
    
    private func setLanguage(){
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            self.title = "idVerification".localizeString(string: "fr-CA")
            lblVerificationTitle.text = "idVerificationTitle".localizeString(string: "fr-CA")
            lblTitleFirst.text = "appearId".localizeString(string: "fr-CA")
            lblTitleSecond.text = "uploadId".localizeString(string: "fr-CA")
            lblUploadTitle.text = "uploadIdTitle".localizeString(string: "fr-CA")
            lblIdDestroyed.text = "idDestroyedTitle".localizeString(string: "fr-CA")
            btnSubmit.setTitle("submitVerification".localizeString(string: "fr-CA"), for: .normal)
            widthSubmitBtn.constant = 220
            
        }else{
            
            self.title = "idVerification".localizeString(string: "en")
            lblVerificationTitle.text = "idVerificationTitle".localizeString(string: "en")
            lblTitleFirst.text = "appearId".localizeString(string: "en")
            lblTitleSecond.text = "uploadId".localizeString(string: "en")
            lblUploadTitle.text = "uploadIdTitle".localizeString(string: "en")
            lblIdDestroyed.text = "idDestroyedTitle".localizeString(string: "en")
            btnSubmit.setTitle("submitVerification".localizeString(string: "en"), for: .normal)
            widthSubmitBtn.constant = 160
           
        }
    }
    override func viewDidLayoutSubviews() {
        
         uplode_img.addDashedBorder()
    }
    
    func fetchIdentityApi(){
        viewModel.idVerficationApi { data in
            self.IdVerfication = data
            
                self.FnameTxt.text = data?.firstNameId ?? ""
                self.lNameTxt.text = data?.lastNameId ?? ""
                self.idImage.sd_setImage(with: URL(string:  data?.identityProofUrl ?? ""), placeholderImage: UIImage(named: ""), options: .refreshCached, context: nil)
                
            let verify = data?.status ?? ""
                
                verify == "0" ? (self.checkImage.image = UIImage(named: "roundCrose")) : (self.checkImage.image = UIImage(named: "roundCheck"))
            
        }
    }

    func saveIdenetiyApi()  {
       
        viewModel.addIdVerificationApi(firstNameId: FnameTxt.text ?? "", lastNameId: lNameTxt.text ?? "", photoId: SelectedimageData) { data in
            self.FnameTxt.text = data?.firstNameId ?? ""
            self.lNameTxt.text = data?.lastNameId ?? ""
            let idImage = data?.identityProofUrl ?? ""
            
            self.idImage.sd_setImage(with: URL(string: idImage), placeholderImage: UIImage(named: ""), options: .refreshCached, context: nil)
            
            let verify = data?.status ?? ""
            
            verify == "0" ? (self.checkImage.image = UIImage(named: "roundCrose")) : (self.checkImage.image = UIImage(named: "roundCheck"))
        }
    }
    
    
    
    //MARK: - ImagePicker
    
    func alertImagePicker() {
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
        
        // Check if the device is an iPad
        if let popoverController = imagePickOption.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
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
    
    
    //MARK:- IBAction

    @IBAction func uploadAction(_ sender: Any) {
        
        alertImagePicker()
    }
    
    @IBAction func submitAction(_ sender: Any) {
        
        var message = String()
        
        if (FnameTxt.text?.count)! < 1 {
            
            message = "Please enter your first name."
        }
        else if (lNameTxt.text?.count)! < 1
        {
            message = "Please enter your last name"
        }
      
        else if SelectedimageData.isEmpty
        {
            message = "Please upload ID picture"
        }
        
        if message.count > 1 {
            
            TostErrorMessage(view: self.view, message: message)
        }
        else
        {
//            saveIdenetiy()
           saveIdenetiyApi()
        }
    }
}
extension idVerificationViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate
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
        uplode_img.image = newImage
        
    }
}
