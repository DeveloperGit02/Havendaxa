//
//  DashboardVC.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 20/01/25.
//

import UIKit
import ObjectMapper
import Alamofire


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
    
    var newsPostLikeListObj : Json4Swift_Base?
    @IBOutlet weak var openImgView: UIImageView!
    @IBOutlet weak var fundedImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //callLoginApi(with: "open")
        // Do any additional setup after loading the view.
        fetchProperties(apiURL: "https://havendaxa.com/mobileapp/properties.php?status=open")
        let openTapGesture = UITapGestureRecognizer(target: self, action: #selector(openTab))
        openImgView.addGestureRecognizer(openTapGesture)
        
        let fundedTapGesture = UITapGestureRecognizer(target: self, action: #selector(fundedTab))
        fundedImgView.addGestureRecognizer(fundedTapGesture)
    }
    @objc func openTab() {
        performSegue(withIdentifier: "personalDetailSegue", sender: nil)
    }
    @objc func fundedTab() {
        
    }
    
    func fetchProperties(apiURL: String) {
        AF.request(apiURL, method: .get)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let array = value as? [[String: Any]] {
                        print("Fetched api response:\( array)")
                        print("Fetched \(array.count) properties.")
                        for property in array {
                            print("Property Title: \(property["title"] as? String ?? "N/A")")
                        }
                    } else {
                        print("Response is not an array of dictionaries.")
                    }
                case .failure(let error):
                    print("Error fetching properties: \(error.localizedDescription)")
                }
            }
    }
}

