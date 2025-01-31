//
//  SinglePropertiesVC.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 25/01/25.
//

import UIKit
import Alamofire

class SinglePropertiesVC: UIViewController {
    
    var propertyObj: [PropertyObjResponse] = []
    var isLoading = true // Flag to track loading state
    
    @IBOutlet weak var customPageControl: UIPageControl! {
        didSet {
            self.customPageControl.isHidden = true
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup collection view
        let nib = UINib(nibName: "PropertiesCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Fetch properties data
        fetchProperties { result in
            DispatchQueue.main.async {
                self.isLoading = false // Stop loading
                self.customPageControl.isHidden = false
                switch result {
                case .success(let response):
                    self.propertyObj = response
                    self.customPageControl.numberOfPages = self.propertyObj.count
                case .failure(let err):
                    print("Error fetching properties: \(err.localizedDescription)")
                }
                self.collectionView.reloadData()
            }
        }
    }
    
    func fetchProperties(apiURL: String = "https://havendaxa.com/mobileapp/properties.php?status=open", completion: @escaping (Result<[PropertyObjResponse], Error>) -> Void) {
        AF.request(apiURL, method: .get)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let array = value as? [[String: Any]] {
                        let properties = array.compactMap { PropertyObjResponse(JSON: $0) }
                        completion(.success(properties))
                    } else {
                        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Response is not an array of dictionaries."])
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension SinglePropertiesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isLoading ? 5 : propertyObj.count // Show 5 placeholder cells during loading
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PropertiesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if isLoading {
            // Configure cell for loading state (e.g., show shimmer/skeleton)
            cell.showPlaceholder()
        } else {
            // Configure cell with actual data
            let responseModel = propertyObj[indexPath.row]
            cell.setupModelData(model: responseModel)
            cell.investNowButton.addTarget(self, action: #selector(handleInvestNowButtonTapped), for: .touchUpInside)
            cell.viewDetailsButton.addTarget(self, action: #selector(handleViewDetailsButtonTapped), for: .touchUpInside)
        }
        
        return cell
    }
    
    @objc func handleInvestNowButtonTapped() {
        print("Invest Now Button Tapped")
        if let investController = self.storyboard?.instantiateViewController(withIdentifier: ApplicantCategoryVC.description()) as? ApplicantCategoryVC {
            self.present(investController, animated: true)
        }
    }
    
    
    @objc func handleViewDetailsButtonTapped() {
        if let detailController =  self.storyboard?.instantiateViewController(withIdentifier: PropertyDetailVC.description()) as? PropertyDetailVC {
            self.present(detailController, animated: true)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleIndex = Int(scrollView.contentOffset.x / scrollView.frame.width + 0.5)
        customPageControl.currentPage = visibleIndex
    }
}
