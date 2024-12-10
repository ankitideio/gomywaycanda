//
//  signUpViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 05/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

import SwiftyJSON

class signUpViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate {

    @IBOutlet weak var lblUploadId: UILabel!
    @IBOutlet weak var lblUploadProfile: UILabel!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnLoginHere: UIButton!
    @IBOutlet weak var lblAlreadyAccount: UILabel!
    @IBOutlet weak var lblDriver: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblEmailAddress: UILabel!
    @IBOutlet weak var lblDateOfBirth: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblRegister: UILabel!
    @IBOutlet weak var txtVwTerms: UITextView!
    @IBOutlet weak var lblTermCondition: UILabel!
    @IBOutlet weak var SwitchBtn: UISwitch!
    @IBOutlet weak var user_name: FormTextField!
    @IBOutlet weak var last_name: FormTextField!
    @IBOutlet weak var name_textfield: FormTextField!
    @IBOutlet weak var dobtextFeild: UITextField!
    @IBOutlet weak var passwordtextFeild: UITextField!
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var idImage: UIImageView!
    @IBOutlet weak var maleGender: UIButton!
    @IBOutlet weak var femaleGender: UIButton!
    @IBOutlet weak var otherGender: UIButton!
    var usertype = String()
    var genderStr = String()
    var pickerOne:Bool?
    var isSelectProfileImg = false
    var iisSelectIdImg = false
    var selectCheckImage = false
    var signUpStatus = true
    var viewModel = AuthVM()
    override func viewDidLoad() {
        super.viewDidLoad()


        setLanguage()
//        setupAgreementLabel()
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datechange(datepicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        dobtextFeild.inputView = datePicker
     //   dobtextFeild.text = formatdate(date: Date())
        usertype = "1"
        SwitchBtn.isOn = false
        dobtextFeild.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: dobtextFeild.frame.height))
        dobtextFeild.leftViewMode = .always
        emailTextFeild.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailTextFeild.frame.height))
        emailTextFeild.leftViewMode = .always
        passwordtextFeild.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordtextFeild.frame.height))
        passwordtextFeild.leftViewMode = .always
        genderStr = "1"
        maleGender.setImage(UIImage(named: "radioUncheck"), for: .normal)
        let padding = UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0)
                txtVwTerms.contentInset = padding
    }
    private func setLanguage(){
  
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            setupAgreementFrench()
            lblRegister.text = "register".localizeString(string: "fr-CA")
            lblFirstName.text = "firstName".localizeString(string: "fr-CA")
            lblLastName.text = "lastName".localizeString(string: "fr-CA")
            lblUserName.text = "userName".localizeString(string: "fr-CA")
            lblDateOfBirth.text = "dateOfBirth".localizeString(string: "fr-CA")
            lblEmailAddress.text = "emailAddress".localizeString(string: "fr-CA")
            lblPassword.text = "password".localizeString(string: "fr-CA")
            lblUploadProfile.text = "uploadProfile".localizeString(string: "fr-CA")
            lblUploadId.text = "uploadIdProof".localizeString(string: "fr-CA")
            lblGender.text = "gender".localizeString(string: "fr-CA")
            maleGender.setTitle("male".localizeString(string: "fr-CA"), for: .normal)
            femaleGender.setTitle("female".localizeString(string: "fr-CA"), for: .normal)
            otherGender.setTitle("others".localizeString(string: "fr-CA"), for: .normal)
            lblAlreadyAccount.text = "alreadyAccount".localizeString(string: "fr-CA")
            btnLoginHere.setTitle("loginHere".localizeString(string: "fr-CA"), for: .normal)
            btnSignUp.setTitle("signup".localizeString(string: "fr-CA"), for: .normal)
            lblDriver.text = "iamDriver".localizeString(string: "fr-CA")
        } else {
            setupAgreementTextView()
            lblRegister.text = "register".localizeString(string: "en")
            lblFirstName.text = "firstName".localizeString(string: "en")
            lblLastName.text = "lastName".localizeString(string: "en")
            lblUserName.text = "userName".localizeString(string: "en")
            lblDateOfBirth.text = "dateOfBirth".localizeString(string: "en")
            lblEmailAddress.text = "emailAddress".localizeString(string: "en")
            lblPassword.text = "password".localizeString(string: "en")
            lblUploadProfile.text = "uploadProfile".localizeString(string: "en")
            lblUploadId.text = "uploadIdProof".localizeString(string: "en")
            lblGender.text = "gender".localizeString(string: "en")
            maleGender.setTitle("male".localizeString(string: "en"), for: .normal)
            femaleGender.setTitle("female".localizeString(string: "en"), for: .normal)
            otherGender.setTitle("others".localizeString(string: "en"), for: .normal)
            lblAlreadyAccount.text = "alreadyAccount".localizeString(string: "en")
            btnLoginHere.setTitle("loginHere".localizeString(string: "en"), for: .normal)
            btnSignUp.setTitle("signup".localizeString(string: "en"), for: .normal)
            lblDriver.text = "iamDriver".localizeString(string: "en")

          
        }
        
    }
    @objc func datechange(datepicker: UIDatePicker){
        dobtextFeild.text = formatdate(date: datepicker.date)
        
    }
    func formatdate(date:Date) -> String {
        let formater = DateFormatter()
        formater.dateFormat = "MMMM dd YYYY"
        return formater.string(from: date)
    }
    func signUpApi(){
        let imgProfile = (profileImage.image?.jpegData(compressionQuality: 0.25))
        let imgIdProof = (idImage.image?.jpegData(compressionQuality: 0.25))
        viewModel.apiSignup(profilePhoto:  imgProfile ?? Data(), idPhoto: imgIdProof ?? Data(), email: emailTextFeild.text ?? "", userName: user_name.text ?? "", password: passwordtextFeild.text ?? "", termAndCondition: "1", firstName: name_textfield.text ?? "", lastName: last_name.text ?? "", dateOfBirth: dobtextFeild.text ?? "", gender: genderStr, userType: usertype, confirmPassword: passwordtextFeild.text ?? "") { data in
            
            let vc = self.storyboard?.instantiateViewController(identifier: "EmailverifyVC") as! EmailverifyVC
            Store.userDetail = data
            vc.newVar = data?.user?.token ?? ""
            vc.idNew = data?.user?.id ?? ""
            vc.emailName = data?.user?.email ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func setupAgreementTextView() {
            let text = "I am agree the terms & privacy policy of Gomyway Canada services Ltd."
            let attributedText = NSMutableAttributedString(string: text)

            // Define range for terms and privacy policy links
            let termsRange = (text as NSString).range(of: "terms")
            let privacyRange = (text as NSString).range(of: "privacy policy")
           
            attributedText.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: termsRange)
            attributedText.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: privacyRange)
             
            // Add link attributes to make the terms and privacy policy clickable
            attributedText.addAttribute(.link, value: "terms://", range: termsRange)
            attributedText.addAttribute(.link, value: "privacy://", range: privacyRange)
        let linkTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 106/255, green: 161/255, blue: 33/255, alpha: 1.0),
                   .underlineStyle: NSUnderlineStyle.single.rawValue,
               ]
        txtVwTerms.linkTextAttributes = linkTextAttributes
        txtVwTerms.attributedText = attributedText
        txtVwTerms.isUserInteractionEnabled = true
        txtVwTerms.delegate = self
        txtVwTerms.isEditable = false
        txtVwTerms.dataDetectorTypes = .link
        }
    private func setupAgreementFrench() {
            let text = "J'accepte les termes et la politique de confidentialité des services Gomyway Canada Ltd."
            let attributedText = NSMutableAttributedString(string: text)

            // Define range for terms and privacy policy links
            let termsRange = (text as NSString).range(of: "termes")
            let privacyRange = (text as NSString).range(of: "politique de confidentialité")
           
            attributedText.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: termsRange)
            attributedText.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: privacyRange)
             
            // Add link attributes to make the terms and privacy policy clickable
            attributedText.addAttribute(.link, value: "termes://", range: termsRange)
            attributedText.addAttribute(.link, value: "politique://", range: privacyRange)
        let linkTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 106/255, green: 161/255, blue: 33/255, alpha: 1.0),
                   .underlineStyle: NSUnderlineStyle.single.rawValue,
               ]
        txtVwTerms.linkTextAttributes = linkTextAttributes
        txtVwTerms.attributedText = attributedText
        txtVwTerms.isUserInteractionEnabled = true
        txtVwTerms.delegate = self
        txtVwTerms.isEditable = false
        txtVwTerms.dataDetectorTypes = .link
        }
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "fr" {
            if URL.absoluteString == "termes://" {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TermConditionVC") as! TermConditionVC
                vc.isComing = true
                vc.modalPresentationStyle = .overFullScreen
                self.navigationController?.present(vc, animated: true)
            } else if URL.absoluteString == "politique://" {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TermConditionVC") as! TermConditionVC
                vc.isComing = false
                vc.modalPresentationStyle = .overFullScreen
                self.navigationController?.present(vc, animated: true)
            }

        }else{
            if URL.absoluteString == "terms://" {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TermConditionVC") as! TermConditionVC
                vc.isComing = true
                vc.modalPresentationStyle = .overFullScreen
                self.navigationController?.present(vc, animated: true)
            } else if URL.absoluteString == "privacy://" {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TermConditionVC") as! TermConditionVC
                vc.isComing = false
                vc.modalPresentationStyle = .overFullScreen
                self.navigationController?.present(vc, animated: true)
            }
        }
           return false // Return false to prevent default behavior
       }

    //MARK: - IBAction
    
    @IBAction func checkAction(_ sender: Any) {
        
        selectCheckImage = true
        if checkBtn.currentImage == UIImage(named: "uncheckWithCorner") {
            
            checkBtn.setImage(UIImage(named: "Frame 5"), for: .normal)
        }
        else
        {
            checkBtn.setImage(UIImage(named: "uncheckWithCorner"), for: .normal)
        }
    }
    
    @IBAction func switchAction(_ sender: Any) {
        if SwitchBtn.isOn {
           usertype = "0"
        } else
        {
            usertype = "1"
        }
        
    }
    @IBAction func maleBtn(_ sender: Any) {
         genderStr = "1"
        maleGender.setImage(UIImage(named: "circle-dot-regular 1"), for: .normal)
        femaleGender.setImage(UIImage(named: "radioUncheck"), for: .normal)
        otherGender.setImage(UIImage(named: "radioUncheck"), for: .normal)
    }
    
    @IBAction func femaleBtn(_ sender: Any) {
        genderStr = "2"
        femaleGender.setImage(UIImage(named: "circle-dot-regular 1"), for: .normal)
        maleGender.setImage(UIImage(named: "radioUncheck"), for: .normal)
        otherGender.setImage(UIImage(named: "radioUncheck"), for: .normal)
        
    }
    
    @IBAction func otherBtn(_ sender: Any) {
        genderStr = "3"
        otherGender.setImage(UIImage(named: "circle-dot-regular 1"), for: .normal)
        femaleGender.setImage(UIImage(named: "radioUncheck"), for: .normal)
        maleGender.setImage(UIImage(named: "radioUncheck"), for: .normal)
    }
    
    @IBAction func signUp_btn_Action(_ sender: Any) {
        
        var message = String()
        
        if (name_textfield.text?.count)! < 1 {
            message = "Please enter your first name"
        }
        else if (last_name.text?.count)!  < 1 {
            message = "Please enter your last name"
        }
        else if (user_name.text?.count)! < 1 {
            message = "Please enter your username"
        }
//        else if (dobtextFeild.text?.count)! < 1 {
//            message = "Please enter your date of birth"
//        }
        else if (emailTextFeild.text?.count)! < 1{
            message = "Please enter your email"
        }
        else if !isValidEmail(emailStr: emailTextFeild.text!)
        {
            message = "Please enter valid email"
        }
        else if (passwordtextFeild.text?.count)! < 1 {
            
            message = "Please enter your password"
        }
        else if isSelectProfileImg == false{
            message = "Please select profile image"
        }
        else if iisSelectIdImg == false {
            message = "Please select id prrof image"
        }
        else if selectCheckImage == false {
            message = "Please agree terms & condition"
        }
        if message.count > 1 {
            
            TostErrorMessage(view: self.view, message: message)
        }
        else
        {
//            signUp()
            signUpApi()
        }
    }
    
    @IBAction func login_btn_Action(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func profileUpload(_ sender: Any) {
        let ac = UIAlertController(title: nil, message: nil , preferredStyle: .actionSheet)
        let cameraBtn = UIAlertAction(title: "Camera", style: .default) { (a) in
            self.showImagePicker(selectedsource: .camera)
        }
        let libarybtn = UIAlertAction(title: "Photo Library", style: .default) { (a) in
            self.showImagePicker(selectedsource: .photoLibrary)        }
        let cancelbtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cameraBtn)
        ac.addAction(libarybtn)
        ac.addAction(cancelbtn)
        pickerOne = true
        
        // Check if the app is running on iPad before presenting as a popover
        if let popoverPresentationController = ac.popoverPresentationController {
            popoverPresentationController.sourceView = self.view // Replace with your desired source view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0) // Adjust source rect as needed
            popoverPresentationController.permittedArrowDirections = []
        }
        self.present(ac, animated: true, completion: nil)
        }
    func showImagePicker(selectedsource: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(selectedsource) else {
        print("selected source is not avaliable")
                return
        }
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = selectedsource
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
        @IBAction func idProofUpload(_ sender: Any) {
        let imageUpload = UIAlertController(title: nil , message: nil, preferredStyle: .actionSheet)
        let cameraButn = UIAlertAction(title: "Camera", style: .default) { (a) in
            self.showPick(selectedSource: .camera)
        }
        let libarayBtn = UIAlertAction(title: "Photo Library", style: .default) { (a) in
            self.showPick(selectedSource: .photoLibrary)
        }
        let cancelButn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        imageUpload.addAction(cameraButn)
        imageUpload.addAction(libarayBtn)
        imageUpload.addAction(cancelButn)
        let imagepick = UIImagePickerController()
        imagepick.delegate = self
        imagepick.allowsEditing = false
        pickerOne = false
            
            // Check if the app is running on iPad before presenting as a popover
            if let popoverPresentationController = imageUpload.popoverPresentationController {
                popoverPresentationController.sourceView = self.view // Replace with your desired source view
                popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0) // Adjust source rect as needed
                popoverPresentationController.permittedArrowDirections = []
            }
            
        self.present(imageUpload, animated: true, completion: nil)
      }
        func showPick(selectedSource:UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else {
            print("source is not available")
            return
        }
        let imagePick = UIImagePickerController()
        imagePick.delegate = self
        imagePick.allowsEditing = false
        imagePick.sourceType = selectedSource
        self.present(imagePick, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if pickerOne == true {
             let selectedImage = info[.originalImage] as? UIImage
            profileImage.image = selectedImage
            isSelectProfileImg = true
         }
        else if pickerOne == false {
            let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage;               idImage.image = chosenImage
            iisSelectIdImg = true
      }
        picker.dismiss(animated: true, completion: nil)
    
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    
    }
    

extension UILabel {
    func indexOfAttributedTextCharacterAtPoint(point: CGPoint) -> Int {
        let textStorage = NSTextStorage(attributedString: self.attributedText!)
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        let textContainer = NSTextContainer(size: self.frame.size)
        layoutManager.addTextContainer(textContainer)
        let index = layoutManager.characterIndex(for: point, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return index
    }
}

