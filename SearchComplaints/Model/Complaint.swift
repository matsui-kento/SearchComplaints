//
//  Complaint.swift
//  SearchComplaints
//
//  Created by matsui kento on 2021/05/27.
//

import Foundation

struct Complaint: Identifiable {
    let id: String
    let address: String
    let complaint: String
    let latitude: Double
    let longitude: Double
    
    init(dictionary: [String: Any]) {
        
        self.id = dictionary["id"] as? String ?? ""
        self.address = dictionary["address"] as? String ?? ""
        self.complaint = dictionary["complaint"] as? String ?? ""
        self.latitude = dictionary["latitude"] as? Double ?? 0
        self.longitude = dictionary["longitude"] as? Double ?? 0
        
    }
}

let testComplaintDic: [String: Any] = ["id": "testtesttest",
                        "address": "テスト住所",
                        "complaint": "テスト苦情",
                        "latitude": 35.7101814,
                        "longitude": 139.6999479]

let testComplaint = Complaint(dictionary: testComplaintDic)
