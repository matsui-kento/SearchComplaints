//
//  FetchViewModel.swift
//  SearchComplaints
//
//  Created by matsui kento on 2021/05/27.
//

import Foundation
import Firebase

class FetchViewModel: ObservableObject {
    @Published var complaints: [Complaint] = []
    
    init() {
        fetchComplaints()
    }
    
    func fetchComplaints() {
        
        let docRef = Firestore.firestore().collection("Complaints")
        docRef.addSnapshotListener { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.complaints = documents.map({ Complaint(dictionary: $0.data()) })
        }
    }
}
