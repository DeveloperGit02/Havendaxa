//
//  LoginVC.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 20/01/25.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var phoneNoTxt: UITextField!
    @IBOutlet weak var facebookLabel: UILabel!
    @IBOutlet weak var instagramLabel : UILabel!
    @IBOutlet weak var linkedInLabel: UILabel!
    @IBOutlet weak var youTudeLabel: UILabel!
    @IBOutlet weak var followUsLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var ibSignUpBtn: UIButton!
    
    @IBOutlet weak var yourPhoneNoLabel: UILabel!
    @IBOutlet weak var createAnAccountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyCustomFonts()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verifyOTPSegue"{
            if let destinationVc =  segue.destination as? VerifyOTPVC {
                destinationVc.phoneNumber = phoneNoTxt.text ?? ""
            }
        }
    }
    
    @IBAction func btnSendOtp(_ sender: UIButton) {
        validateAndSendOTP()
        //        performSegue(withIdentifier:"verifyOTPSegue", sender: nil)
    }
    @IBAction func signUpBtn(_ sender: UIButton) {
        
    }
}
extension LoginVC {
    func applyCustomFonts() {
        ibSignUpBtn.titleLabel?.font = UIFont(name: AppFontStrings.Poppins_Bold, size: 15)
        facebookLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 12)
        instagramLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 12)
        linkedInLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 12)
        youTudeLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 12)
        followUsLabel.font = UIFont(name: AppFontStrings.Poppins_Bold, size: 15)
        countryCodeLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 16)
        phoneNoTxt.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 16)
        yourPhoneNoLabel.font = UIFont(name: AppFontStrings.Poppins_Bold, size: 26)
        createAnAccountLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 15)
        
        
    }
    
}

 //MARK: - Input Validation and API Call
extension LoginVC {
    private func validateAndSendOTP() {
        guard let phoneNumber = phoneNoTxt.text, !phoneNumber.isEmpty else {
            showToast(message: AppMessages.MSG_PHONE_NUMBER_EMPTY)
            return
        }
        guard isValidPhoneNumber(phoneNumber) else {
            showToast(message: AppMessages.MSG_PHONE_NUMBER_INVALID)
            return
        }
        
        callLoginApi(with: phoneNumber)
    }
    
    private func callLoginApi(with phoneNumber: String) {
        let apiUrl = "\(Base_Url)\(End_Points.Api_Login.getEndpoints).php?number=\(phoneNumber)"
        let apiRequest = ApiRequest()
        apiRequest.delegate = self
        apiRequest.requestAPI(apiName: End_Points.Api_Login.getEndpoints, apiRequestURL: apiUrl)
    }
    private func showToast(message: String) {
        CommonObjects.shared.showToast(message: message, controller: self)
    }
    private func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        // Check if the phone number is exactly 10 digits
        let phoneRegex = "^[0-9]{10}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: phoneNumber)
    }
}

 //MARK: - API Response Handling
extension LoginVC: RequestApiDelegate {
    
    func success(api: String, response: [String: Any]) {
        guard api == End_Points.Api_Login.getEndpoints,
              let message = response["sendotp"] as? String else { return }
        
        DispatchQueue.main.async {
            self.showToast(message: message)
            // Uncomment the line below if you want to navigate to the OTP screen automatically.
            //self.performSegue(withIdentifier: "verifyOTPSegue", sender: nil)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.performSegue(withIdentifier: "verifyOTPSegue", sender: nil)
        }
    }
    
    func failure() {
        DispatchQueue.main.async {
            self.showToast(message: AppMessages.MSG_FAILURE_ERROR)
        }
    }
}
