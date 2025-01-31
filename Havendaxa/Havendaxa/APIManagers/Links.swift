//
//  Links.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 20/01/25.
//

import Foundation
let Base_Url = "https://havendaxa.com/mobileapp/"


enum End_Points {
    case Api_Login
    case Api_Verify_Otp
    case Api_Properties
    case Api_Single_Property
    

    var getEndpoints : String {
        get {
            switch self {
            
            case .Api_Login:
                "sendotp"
                case .Api_Verify_Otp:
                "verifyotp"
                case .Api_Properties:
                "properties"
                case .Api_Single_Property:
                "singleproperty"
            }
        }
    }
}
//https://havendaxa.com/mobileapp/properties.php?status=open
