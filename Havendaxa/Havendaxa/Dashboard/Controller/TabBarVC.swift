//
//  TabBarVC.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 24/01/25.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let items = tabBar.items {
//            let selectedColors: [UIColor] = [
//                .AppBlue,    // Tab 1 selected color
//                .blue,   // Tab 2 selected color
//                .green,  // Tab 3 selected color
//                .purple  // Tab 4 selected color
//            ]
            
            for (_, item) in items.enumerated() {
                // Default (normal) attributes
                let normalAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont(name: AppFontStrings.Poppins_Regular, size: 12) ?? "",
                    .foregroundColor: UIColor.gray // Normal state color
                ]
                item.setTitleTextAttributes(normalAttributes, for: .normal)
                
                // Selected attributes with unique colors
                let selectedAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont(name: AppFontStrings.Poppins_Regular, size: 12) ?? "",
                    .foregroundColor: UIColor.black
                        //selectedColors[index]
                ]
                item.setTitleTextAttributes(selectedAttributes, for: .selected)
            }
        }
    }
}


