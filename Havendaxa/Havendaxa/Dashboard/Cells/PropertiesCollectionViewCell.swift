//
//  PropertiesCollectionViewCell.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 25/01/25.
//

import UIKit
import SDWebImage
import SkeletonView

class PropertiesCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet weak var propertyImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var targetIRRlabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var yieldLabel: UILabel!
    
    @IBOutlet weak var viewDetailsButton: UIButton!
    
    @IBOutlet weak var investNowButton: UIButton!
    
    private let shimmerLayer = CAGradientLayer() // Shimmer gradient layer
      
      override func awakeFromNib() {
          super.awakeFromNib()
          setupSkeletonView()
          setupShimmerEffect() // Initialize shimmer effect
      }
      
      // MARK: - Setup Skeleton View
      private func setupSkeletonView() {
          // Enable skeleton for each view
          [propertyImageView, titleLabel, addressLabel, dateLabel, targetIRRlabel, costLabel, yieldLabel].forEach {
              $0?.isSkeletonable = true
          }
      }
      
      // MARK: - Setup Shimmer Effect
      private func setupShimmerEffect() {
          shimmerLayer.colors = [
              UIColor.gray.withAlphaComponent(0.3).cgColor,
              UIColor.white.withAlphaComponent(0.7).cgColor,
              UIColor.gray.withAlphaComponent(0.3).cgColor
          ]
          shimmerLayer.startPoint = CGPoint(x: 0, y: 0) // Top-left corner
          shimmerLayer.endPoint = CGPoint(x: 1, y: 1)   // Bottom-right corner
          shimmerLayer.locations = [0, 0.5, 1]
          shimmerLayer.frame = bounds
          shimmerLayer.cornerRadius = 8
          layer.addSublayer(shimmerLayer)
      }
      
      func startShimmerAnimation() {
          let animation = CABasicAnimation(keyPath: "locations")
          animation.fromValue = [-1, -0.5, 0]
          animation.toValue = [1, 1.5, 2]
          animation.duration = 1.5
          animation.repeatCount = .infinity
          shimmerLayer.add(animation, forKey: "shimmerAnimation")
      }
      
      func stopShimmerAnimation() {
          shimmerLayer.removeAnimation(forKey: "shimmerAnimation")
          shimmerLayer.removeFromSuperlayer()
      }
      
      // MARK: - Configure Cell with Model Data
      func setupModelData(model: PropertyObjResponse) {
          // Stop shimmer animation when loading data
          stopShimmerAnimation()
          
          // Load and display the property image
          if let imageURL = model.img1, let url = URL(string: imageURL) {
              propertyImageView.sd_setImage(with: url) { [weak self] _, _, _, _ in
                  self?.propertyImageView.hideSkeleton()
              }
          } else {
              propertyImageView.image = UIImage(named: "placeholderImage")
          }
          
          // Set the text for other labels with safe unwrapping
          titleLabel.text = model.title ?? "No Title Available"
          addressLabel.text = model.address ?? "No Address Available"
          dateLabel.text = model.post_date != nil ? "Published on: \(model.post_date!)" : "Published Date: N/A"
          yieldLabel.text = model.avg_yield ?? "N/A"
          costLabel.text = model.cost ?? "N/A"
          targetIRRlabel.text = model.target_irr ?? "N/A"
      }
      
      // MARK: - Show Placeholder (For Skeleton Loading)
      func showPlaceholder() {
          // Start shimmer animation for loading state
          startShimmerAnimation()
          propertyImageView.backgroundColor = .lightBlue
          titleLabel.text = "Loading..."
          addressLabel.text = "Loading..."
          dateLabel.text = "Loading..."
          yieldLabel.text = "N/A"
          costLabel.text = "N/A"
          targetIRRlabel.text = "N/A"
      }
  }
