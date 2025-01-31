////
////  ApiManager.swift
////  Havendaxa
////
////  Created by Vijay Sharma on 24/01/25.
////
//
//import Foundation
//import UIKit
//import Alamofire
//
//class APIManager {
//    var delegate: RequestApiDelegate?
//
//    func requestAPI(apiName: String, apiRequestURL: String, parameters: [String: Any]) {
//        // Configure headers if needed
//        let headers: HTTPHeaders = [
//            "Content-Type": "application/json"
//        ]
//        
//        // Make the POST request with parameters
//        AF.request(apiRequestURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
//            .validate() // Validate the status code and response format
//            .responseJSON { response in
//                switch response.result {
//                case .success(let value):
////                    if let jsonArray = value as? [[String: Any]] {
////                        // JSON is an array of dictionaries
////                        self.delegate?.success(api: apiName, response: ["": jsonArray])
////                    } else if let jsonDict = value as? [String: Any] {
////                        // JSON is a single dictionary
////                        self.delegate?.success(api: apiName, response: jsonDict)
////                    } else {
////                        // Unexpected JSON format
////                        print("Unexpected JSON format")
////                        self.delegate?.failure()
////                    }
//                    print("Fetched \((value as AnyObject).count) properties.")
//                                    for property in value {
//                                        print("Title: \(property.title)")
//                                    }
//
//                case .failure(let error):
//                    print("Error: \(error.localizedDescription)")
//                    self.delegate?.failure()
//                }
//            }
//    }
//}
//
//protocol RequestApiDelegate {
//    func success(api: String, response: [String: Any])
//    func failure()
//}
