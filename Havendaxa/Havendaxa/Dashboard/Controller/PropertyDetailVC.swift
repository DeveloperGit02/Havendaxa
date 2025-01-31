//
//  PropertyDetailVC.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 27/01/25.
//

import UIKit

class PropertyDetailVC: UIViewController {

    @IBOutlet weak var propertyNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var investmentAmtLabel: UILabel!
    @IBOutlet weak var minInvestmentLabel: UILabel!
    
    @IBOutlet weak var entryYieldLabel: UILabel!
    @IBOutlet weak var targetIRRLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tenancyLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomFonts()
        setCustomColors()
    }
    
    override class func description() -> String {
        "PropertyDetailVC"
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
extension PropertyDetailVC {
    func setCustomFonts() {
        propertyNameLabel.font = UIFont(name: "Poppins-Bold", size: 26)
        addressLabel.font = UIFont(name: "Poppins-Medium", size: 12)
        investmentAmtLabel.font = UIFont(name: "Poppins-Bold", size: 26)
        minInvestmentLabel.font = UIFont(name: "Poppins-Medium", size: 12)
        entryYieldLabel.font = UIFont(name: "Poppins-Bold", size: 14)
        targetIRRLabel.font = UIFont(name: "Poppins-Bold", size: 14)
        
        overviewLabel.font = UIFont(name: "Poppins-Bold", size: 15)
        locationLabel.font = UIFont(name: "Poppins-Bold", size: 15)
        tenancyLabel.font = UIFont(name: "Poppins-Bold", size: 15)
        priceLabel.font = UIFont(name: "Poppins-Bold", size: 15)
        
    }
    func setCustomColors() {
        propertyNameLabel.textColor = .AppBlue
        addressLabel.textColor = .AppBlue
        investmentAmtLabel.textColor = .AppPurple
    }
}

