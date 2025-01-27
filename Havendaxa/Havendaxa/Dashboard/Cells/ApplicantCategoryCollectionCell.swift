//
//  ApplicantCategoryCollectionCell.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 27/01/25.
//

import UIKit

class ApplicantCategoryCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.font = UIFont(name: AppFontStrings.Poppins_Bold, size: 16)
    }

}
