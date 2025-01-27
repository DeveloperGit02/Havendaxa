//
//  VerifyOTPVC.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 20/01/25.
//

import UIKit
import SVPinView

class VerifyOTPVC: UIViewController {

    @IBOutlet weak var pinView: SVPinView!
    @IBOutlet weak var facebookLabel: UILabel!
    @IBOutlet weak var instagramLabel: UILabel!
    @IBOutlet weak var linkedLbLebel: UILabel!
    @IBOutlet weak var youTudeLabel: UILabel!
    @IBOutlet weak var followUsLabel: UILabel!
    @IBOutlet weak var createAnAccountLabel: UILabel!
    @IBOutlet weak var verityOTPLabel: UILabel!
    @IBOutlet weak var ibSignUpBtn: UIButton!
    
    
    var phoneNumber : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyCustomFonts()
        configurePinView()
    }
//    func didFinishCallback() {
//        let pin = pinView.getPin()
//        
//        guard !pin.isEmpty else {
//            showAlert(title: "Error", message: "Please enter OTP")
//            return
//        }
//        print(pin)
//        callOTPVerifyApi(pin: pin)
//    }
    @IBAction func btnVerifyOtp(_ sender: Any) {
        //didFinishCallback()
//        performSegue(withIdentifier: "dashboardSegue", sender: nil)
    }
    
}

extension VerifyOTPVC {
    func applyCustomFonts() {
        ibSignUpBtn.titleLabel?.font = UIFont(name: AppFontStrings.Poppins_Bold, size: 15)
        facebookLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 12)
        instagramLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 12)
        linkedLbLebel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 12)
        youTudeLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 12)
        followUsLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 15)
        verityOTPLabel.font = UIFont(name: AppFontStrings.Poppins_Bold, size: 26)
        createAnAccountLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 12)
        ibSignUpBtn.titleLabel?.textAlignment = .left
    }
    func configurePinView() {
        pinView.style = .box
        pinView.fieldCornerRadius = 10
        pinView.activeFieldCornerRadius = 10
        pinView.interSpace = 10
        pinView.font = UIFont(name: AppFontStrings.Poppins_Bold, size: 18)!
    }
    
}
// MARK: - OTP Validation and API Call
extension VerifyOTPVC {
    
    private func validateAndVerifyOTP() {
        let pin = pinView.getPin()
        
        guard !pin.isEmpty else {
            showAlert(title: "Error", message:  "Please enter OTP")
            return
        }
        
        callOTPVerifyApi(pin: pin)
    }
    
    private func callOTPVerifyApi(pin: String) {
        let apiUrl = "\(Base_Url)\(End_Points.Api_Verify_Otp.getEndpoints).php?mobile=\(phoneNumber)&otp=\(pin)"
        let apiRequest = ApiRequest()
        apiRequest.delegate = self
        apiRequest.requestAPI(apiName: End_Points.Api_Verify_Otp.getEndpoints, apiRequestURL: apiUrl)
    }
}
// MARK: - API Response Handling
extension VerifyOTPVC: RequestApiDelegate {
    
    func success(api: String, response: [String: Any]) {
        guard api == End_Points.Api_Verify_Otp.getEndpoints else { return }
        
        if let sessionStatus = response["session_status"] as? String, sessionStatus == "Active" {
            navigateToDashboard()
        } else {
            showToast(message: "OTP is incorrect")
        }
    }
    
    func failure() {
        showToast(message: AppMessages.MSG_FAILURE_ERROR)
    }
}

// MARK: - Utility Methods
extension VerifyOTPVC {
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func showToast(message: String) {
        CommonObjects.shared.showToast(message: message, controller: self)
    }
    
    private func navigateToDashboard() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "dashboardSegue", sender: nil)
        }
    }
}

