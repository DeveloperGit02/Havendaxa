//
//  CommonObjects.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 20/01/25.
//

import Foundation
import Toast_Swift
import SVProgressHUD
import UIKit

class CommonObjects {
    static let shared = CommonObjects()
    
    private init() {}
    
    func showToast(message: String, controller:UIViewController) {
        controller.view.makeToast(message)
    }
    func showToast(message:String) {
        let windows = UIApplication.shared.windows
        windows.last?.makeToast(message,duration: 3.0, position: .bottom)
    }
    func showProgress() {
        SVProgressHUD.setBackgroundColor(.clear)
        SVProgressHUD.setForegroundColor(.gray)
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.appearance().ringRadius = 10
        SVProgressHUD.appearance().ringThickness = 5
        SVProgressHUD.show()
    }
    func stopProgress() {
        SVProgressHUD.dismiss()
    }
    
}
