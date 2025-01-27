//
//  SinglePropertiesVC.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 25/01/25.
//

import UIKit

class SinglePropertiesVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func setUpTableView() {
        let nib = UINib(nibName: "PropertiesCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
    }
}
extension SinglePropertiesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PropertiesCollectionViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Set cell size to match the collection view's visible size
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width)
    }
    
}
