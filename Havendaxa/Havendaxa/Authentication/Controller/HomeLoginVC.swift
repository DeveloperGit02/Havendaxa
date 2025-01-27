//
//  HomeLoginVC.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 20/01/25.
//

import UIKit

class HomeLoginVC: UIViewController {
    
    @IBOutlet weak var exclusiveLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var followUsLbl: UILabel!
    @IBOutlet weak var facebookLbl: UILabel!
    @IBOutlet weak var instagramLbl: UILabel!
    @IBOutlet weak var linkedlnLbl: UILabel!
    @IBOutlet weak var youtudeLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyCustomFonts()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogin(_ sender: Any) {
//        performSegue(withIdentifier: "loginVCSegue", sender: nil)
//        dashbordtestsegue
        performSegue(withIdentifier: "dashbordtestsegue", sender: nil)
    }
    
}

extension HomeLoginVC {
    func applyCustomFonts() {
        // Replace "YourFontName" with the PostScript name of your custom font
        
        exclusiveLbl.font = UIFont(name: AppFontStrings.Poppins_Bold, size: 26)
        descriptionLbl.font = UIFont(name: AppFontStrings.Poppins_Light, size: 12)
        followUsLbl.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 15)
        facebookLbl.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 12)
        instagramLbl.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 12)
        linkedlnLbl.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 12)
        youtudeLbl.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 12)
    }
}
