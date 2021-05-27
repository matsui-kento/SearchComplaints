//
//  SearchComplaintsApp.swift
//  SearchComplaints
//
//  Created by matsui kento on 2021/05/26.
//

import SwiftUI
import Firebase

@main
struct SearchComplaintsApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
        }
    }
}
