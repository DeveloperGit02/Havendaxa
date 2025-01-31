//
//  TransactionVC.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 23/01/25.
//

import UIKit

class TransactionVC: UIViewController {
    
    @IBOutlet weak var totalInvestmentTitleLbl: UILabel!
    @IBOutlet weak var totalInvestmentLabel: UILabel!
    @IBOutlet weak var totalRentTitleLabel: UILabel!    
    @IBOutlet weak var totalRentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDashboardNavBar(title: "Transaction")
        applyCustomFonts()
        // Do any additional setup after loading the view.
    }
}
extension TransactionVC {
    func applyCustomFonts() {
        totalInvestmentTitleLbl.font = UIFont(name: AppFontStrings.Poppins_Bold, size: 16)
        totalInvestmentLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 13)
        
        totalRentTitleLabel.font = UIFont(name: AppFontStrings.Poppins_Bold, size: 16)
        totalRentLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 13)
    }
}
