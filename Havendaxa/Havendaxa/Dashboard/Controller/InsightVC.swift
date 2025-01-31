//
//  InsightVC.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 22/01/25.
//

import UIKit

class InsightVC: UIViewController {
    let data = ["About Us", "Our Pillars & Strength", "Our Key Goals", "Knowledge Bank", "Blogs", "FAQs"]
    let imageData = ["About", "P&S", "KG", "KB", "Blogs", "FAQ"]


    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
extension InsightVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InsightCell", for: indexPath) as! InsightTableViewCell
        cell.titleLbl.text = data[indexPath.row]
        cell.imgView.image = UIImage(named: imageData[indexPath.row])
        cell.titleLbl.font = UIFont(name: AppFontStrings.Poppins_Regular, size: 15)
        return cell
    }
    
    
}
