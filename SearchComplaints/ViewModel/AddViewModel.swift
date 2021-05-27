//
//  AddViewModel.swift
//  SearchComplaints
//
//  Created by matsui kento on 2021/05/27.
//

import Foundation
import Firebase

class AddViewModel : ObservableObject {
    
    let viewModel: FetchViewModel = FetchViewModel()
    
    func addComplaint(latitude: Double, longitude: Double, complaint: String, address: String) {
        
        let duplicate: [Complaint] = viewModel.complaints.filter({ $0.latitude.isEqual(to: latitude) && $0.longitude.isEqual(to: longitude) })
        
        if duplicate.count != 0 {
            let complaints = complaint + "\n" + duplicate[0].complaint
            let docRef = Firestore.firestore().collection("Complaints")
            docRef.document(duplicate[0].id).updateData(["complaint": complaints])
            
        } else {
            let docRef = Firestore.firestore().collection("Complaints").document()
            let data: [String: Any] = ["id": docRef.documentID,
                                       "latitude": latitude,
                                       "longitude": longitude,
                                       "complaint": complaint,
                                       "address": address]
            
            docRef.setData(data)
        }
    }
}
