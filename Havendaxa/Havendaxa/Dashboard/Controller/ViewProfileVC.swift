//
//  ViewProfileVC.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 22/01/25.
//

import UIKit

class ViewProfileVC: UIViewController {

   // @IBOutlet weak var myProfileTitleLabel: UILabel!
    
    @IBOutlet weak var personalInfoLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var userPhoneNoLabel: UILabel!
    @IBOutlet weak var emailTitleLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBOutlet weak var communicationLabel: UILabel!
    @IBOutlet weak var contactTitleLabel: UILabel!
    @IBOutlet weak var whatappLabel: UILabel!
    
    @IBOutlet weak var securityLabel: UILabel!
    @IBOutlet weak var changePasswordLabel: UILabel!
    @IBOutlet weak var screenLockLabel: UILabel!
    @IBOutlet weak var deactivateACLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyCustomFonts()
        setupNavigationBar()
    }
    

}
extension ViewProfileVC {
    func applyCustomFonts() {
        //myProfileTitleLabel.font = UIFont(name: AppFontStrings.Poppins_Bold, size: 10)
        personalInfoLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 20)
        nameLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 11)
        usernameLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 15)
        contactLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 11)
        userPhoneNoLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 15)
        emailTitleLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 11)
        userEmailLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 15)
        
        communicationLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 20)
        contactTitleLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 11)
        whatappLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 15)
        securityLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 20)
        changePasswordLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 15)
        screenLockLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 15)
        deactivateACLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 15)
        
    }
}
