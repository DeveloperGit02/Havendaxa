//
//  Model.swift
//  Havendaxa
//
//  Created by Vijay Sharma on 24/01/25.
//

import Foundation
import ObjectMapper

struct Json4Swift_Base : Mappable {
    var id : String?
    var propid : String?
    var title : String?
    var status : String?
    var cost : String?
    var min_invest : String?
    var entry_yield : String?
    var target_irr : String?
    var address : String?
    var post_date : String?
    var description : String?
    var avg_yield : String?
    var total_area : String?
    var tenant : String?
    var montly_rent : String?
    var escalation : String?
    var security_deposite : String?
    var lease_tenure : String?
    var why_us : String?
    var gross_purchase : String?
    var stamp_registration : String?
    var legal_due : String?
    var admin_fee : String?
    var acquisition : String?
    var reserves : String?
    var net_total : String?
    var lease_dead : String?
    var propert_regis : String?
    var financial_cal : String?
    var video : String?
    var layout : String?
    var location : String?
    var amenities : String?
    var img1 : String?
    var img2 : String?
    var img3 : String?
    var img4 : String?
    var mobile_img : String?
    var dark_img1 : String?
    var dark_img2 : String?
    var dark_img3 : String?
    var dark_img4 : String?
    var dark_mobile_img : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        propid <- map["propid"]
        title <- map["title"]
        status <- map["status"]
        cost <- map["cost"]
        min_invest <- map["min_invest"]
        entry_yield <- map["entry_yield"]
        target_irr <- map["target_irr"]
        address <- map["address"]
        post_date <- map["post_date"]
        description <- map["description"]
        avg_yield <- map["avg_yield"]
        total_area <- map["total_area"]
        tenant <- map["tenant"]
        montly_rent <- map["montly_rent"]
        escalation <- map["escalation"]
        security_deposite <- map["security_deposite"]
        lease_tenure <- map["lease_tenure"]
        why_us <- map["why_us"]
        gross_purchase <- map["gross_purchase"]
        stamp_registration <- map["stamp_registration"]
        legal_due <- map["legal_due"]
        admin_fee <- map["admin_fee"]
        acquisition <- map["acquisition"]
        reserves <- map["reserves"]
        net_total <- map["net_total"]
        lease_dead <- map["lease_dead"]
        propert_regis <- map["propert_regis"]
        financial_cal <- map["financial_cal"]
        video <- map["video"]
        layout <- map["layout"]
        location <- map["location"]
        amenities <- map["amenities"]
        img1 <- map["img1"]
        img2 <- map["img2"]
        img3 <- map["img3"]
        img4 <- map["img4"]
        mobile_img <- map["mobile_img"]
        dark_img1 <- map["dark_img1"]
        dark_img2 <- map["dark_img2"]
        dark_img3 <- map["dark_img3"]
        dark_img4 <- map["dark_img4"]
        dark_mobile_img <- map["dark_mobile_img"]
    }

}
