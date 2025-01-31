//
//  Ext-ViewController.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 23/01/25.
//

import Foundation
import UIKit

extension UIViewController {
    func setupNavigationBar() {
        // Set the navigation title
        self.navigationItem.title = "My Profile"
        
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.AppBlue, // Title color
            .font: UIFont(name: AppFontStrings.Poppins_Bold, size: 20) ?? UIFont.systemFont(ofSize: 25) // Title font and size
        ]
        
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        // Create a custom back button with image and text
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: "arrow-down-sign-to-navigate"), for: .normal)
        backButton.tintColor =  .black // Set image and text color
        backButton.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        
        // Create a UIBarButtonItem using the custom button
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
    }
//    func backBtn(title:String, imageName: String? = "arrow-down-sign-to-navigate"){
//        
////        let backBtnName = UIButton()
////        backBtnName.setTitle(title, for: .normal)
////        backBtnName.titleLabel?.font = UIFont(name: AppFontStrings.Poppins_Bold, size: 20) // To add BackButton title
////        backBtnName.titleLabel?.textColor = .AppBlue
//        
//        let backButtonImg = UIButton()
//        backButtonImg.setImage(UIImage(named: imageName ?? ""), for: .normal)
//        backButtonImg.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside) // Back Btn Action
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView:backButtonImg)
//                                                 // UIBarButtonItem(customView: backBtnName)]
//    }
    @objc func backBtnTapped(_ sender: UIBarButtonItem) {
        if self.navigationController?.viewControllers.count == 1 {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    func setupDashboardNavBar(title:String) {
        // Left Label
        let leftLabel = UILabel()
        leftLabel.text = title
        leftLabel.font = UIFont(name: AppFontStrings.Poppins_Bold, size: 18) ?? UIFont.systemFont(ofSize: 18)
        leftLabel.textColor = .AppBlue
        let leftBarButton = UIBarButtonItem(customView: leftLabel)
        self.navigationItem.leftBarButtonItem = leftBarButton

        // First Right Button
        let rightButton1 = UIButton(type: .system)
        rightButton1.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        rightButton1.setImage(UIImage(named: "Bell"), for: .normal)
        rightButton1.tintColor = .black
        
        rightButton1.addTarget(self, action: #selector(rightButton1Tapped), for: .touchUpInside)
        let rightBarButtonItem1 = UIBarButtonItem(customView: rightButton1)

        // Second Right Button
        let rightButton2 = UIButton(type: .system)
        rightButton2.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        rightButton2.setImage(UIImage(named: "Question mark"), for: .normal)
        rightButton2.tintColor = .black
        
        rightButton2.addTarget(self, action: #selector(rightButton2Tapped), for: .touchUpInside)
        let rightBarButtonItem2 = UIBarButtonItem(customView: rightButton2)

        // Add buttons to the right side
        self.navigationItem.rightBarButtonItems = [rightBarButtonItem1, rightBarButtonItem2]
    }
    @objc func rightButton1Tapped() {
        print("Right Button 1 Tapped")
        // Perform your action here
    }

    @objc func rightButton2Tapped() {
        print("Right Button 2 Tapped")
        // Perform your action here
    }
}
