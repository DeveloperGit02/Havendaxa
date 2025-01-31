//
//  PropertyModel.swift
//  Havendaxa
//
//  Created by Piyush Sharma on 27/01/25.
//


import Foundation

// MARK: - PropertiesResponse

struct PropertyResponse: Codable {
    let id: String
    let propid: String
    let title: String
    let status: String
    let cost: String
    let minInvest: String
    let entryYield: String
    let targetIRR: String
    let address: String
    let postDate: String
    let description: String
    let avgYield: String
    let totalArea: String
    let tenant: String
    let monthlyRent: String
    let escalation: String
    let securityDeposit: String
    let leaseTenure: String
    let whyUs: String
    let grossPurchase: String
    let stampRegistration: String
    let legalDue: String
    let adminFee: String
    let acquisition: String
    let reserves: String
    let netTotal: String
    let leaseDead: String
    let propertyRegistration: String
    let financialCal: String
    let video: String
    let layout: String
    let location: String
    let amenities: String
    let img1: String
    let img2: String
    let img3: String
    let img4: String
    let mobileImg: String
    let darkImg1: String
    let darkImg2: String
    let darkImg3: String
    let darkImg4: String
    let darkMobileImg: String

    enum CodingKeys: String, CodingKey {
        case id
        case propid
        case title
        case status
        case cost
        case minInvest = "min_invest"
        case entryYield = "entry_yield"
        case targetIRR = "target_irr"
        case address
        case postDate = "post_date"
        case description
        case avgYield = "avg_yield"
        case totalArea = "total_area"
        case tenant
        case monthlyRent = "montly_rent"
        case escalation
        case securityDeposit = "security_deposite"
        case leaseTenure = "lease_tenure"
        case whyUs = "why_us"
        case grossPurchase = "gross_purchase"
        case stampRegistration = "stamp_registration"
        case legalDue = "legal_due"
        case adminFee = "admin_fee"
        case acquisition
        case reserves
        case netTotal = "net_total"
        case leaseDead = "lease_dead"
        case propertyRegistration = "propert_regis"
        case financialCal = "financial_cal"
        case video
        case layout
        case location
        case amenities
        case img1
        case img2
        case img3
        case img4
        case mobileImg = "mobile_img"
        case darkImg1 = "dark_img1"
        case darkImg2 = "dark_img2"
        case darkImg3 = "dark_img3"
        case darkImg4 = "dark_img4"
        case darkMobileImg = "dark_mobile_img"
    }
}

// Usage example for decoding:
func decodeProperties(from jsonData: Data) throws -> [PropertyResponse] {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return try decoder.decode([PropertyResponse].self, from: jsonData)
}
