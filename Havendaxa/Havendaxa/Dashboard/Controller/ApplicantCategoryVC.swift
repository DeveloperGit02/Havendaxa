//
//  ApplicantCategoryVC.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 27/01/25.
//

import UIKit

class ApplicantCategoryVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let imageArr = ["individual", "LLP", "Private", "Joint", "Partnership", "HUF"]
    let titleArr = ["Individual", "LLP", "Private", "Joint", "Partnership", "HUF"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDashboardNavBar(title: "Applicant Category")
        setUpCollectionView()
        // Do any additional setup after loading the view.
    }
    
    override class func description() -> String {
        "ApplicantCategoryVC"
    }
    func setUpCollectionView() {
        let nib = UINib(nibName: "ApplicantCategoryCollectionCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "categoryCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
extension ApplicantCategoryVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! ApplicantCategoryCollectionCell
        cell.imageView.image = UIImage(named: imageArr[indexPath.row])
        cell.titleLabel.text = titleArr[indexPath.row]
        
        
        return cell
    }
}
extension ApplicantCategoryVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 10 // Adjust for spacing
        return CGSize(width: width, height: width+15) // Square cells
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
