//
//  DashboardVC.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 20/01/25.
//

import UIKit
import ObjectMapper


//struct Property {
//    let id: String
//    let propId: String
//    let title: String
//    let status: String
//    let cost: String
//    let minInvest: String
//    let entryYield: String
//    let targetIrr: String
//    let address: String
//    let postDate: String
//    let description: String
//    let avgYield: String
//    let totalArea: String
//    let tenant: String
//    let monthlyRent: String
//    let escalation: String
//    let securityDeposit: String
//    let leaseTenure: String
//    let whyUs: String
//    let grossPurchase: String
//    let stampRegistration: String
//    let legalDue: String
//    let adminFee: String
//    let acquisition: String
//    let reserves: String
//    let netTotal: String
//    let leaseDead: String
//    let propertyRegis: String
//    let financialCal: String
//    let video: String
//    let layout: String
//    let location: String
//    let amenities: String
//    let images: [String]
//    let mobileImage: String
//    let darkImages: [String]
//    let darkMobileImage: String
//}


class DashboardVC: UIViewController {
    
     @IBOutlet weak var openImgView: UIImageView!
    @IBOutlet weak var fundedImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //callLoginApi(with: "open")
        // Do any additional setup after loading the view.
        
        let openTapGesture = UITapGestureRecognizer(target: self, action: #selector(openTab))
        openImgView.addGestureRecognizer(openTapGesture)
        
        let fundedTapGesture = UITapGestureRecognizer(target: self, action: #selector(fundedTab))
        fundedImgView.addGestureRecognizer(fundedTapGesture)
    }
    @objc func openTab() {
          if let controller = self.storyboard?.instantiateViewController(withIdentifier: "SinglePropertiesVC") as? SinglePropertiesVC {
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true)
         }
     }
    
    @objc func fundedTab() {
        
    }

}

