//
//  ProfileViewController.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 22/01/25.
//

import UIKit

class ProfileViewController: UIViewController {
    let data = ["KYC", "Disclaimer", "Privacy Policy", "Terms and Conditions"]
    let imageData = ["About", "P&S", "KG", "KB"]
    @IBOutlet weak var viewProfileView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var viewProfileLabel: UILabel!
    @IBOutlet weak var linkedAcLabel: UILabel!
    @IBOutlet weak var virtualAcLabel: UILabel!
    @IBOutlet weak var investmentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyCustomFonts()
        applyTapGesture()
    }
    
    func applyTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        viewProfileView.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func handleTap() {
        performSegue(withIdentifier: "viewProfileSegue", sender: nil)
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InsightCell", for: indexPath) as! InsightTableViewCell
        cell.titleLbl.text = data[indexPath.row]
        cell.imgView.image = UIImage(named: imageData[indexPath.row])
        cell.titleLbl.font = UIFont(name: "Poppins-Regular", size: 15)
        return cell
    }
    
    
}

extension ProfileViewController {
    func applyCustomFonts() {
        nameLabel.font = UIFont(name: AppFontStrings.Poppins_SemiBold, size: 17)!
        emailLabel.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 13)!
        viewProfileLabel.font = UIFont(name: AppFontStrings.Poppins_Medium, size: 13)!
        linkedAcLabel.font = UIFont(name: AppFontStrings.Poppins_Medium, size: 13)!
        virtualAcLabel.font = UIFont(name: AppFontStrings.Poppins_Medium, size: 13)!
        investmentLabel.font = UIFont(name: AppFontStrings.Poppins_Medium, size: 13)!
        
    }
}
