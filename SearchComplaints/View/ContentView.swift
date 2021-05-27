//
//  ContentView.swift
//  SearchComplaints
//
//  Created by matsui kento on 2021/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            AddComplaintView()
                .tabItem {
                    Image(systemName: "plus")
                }
            
            MapContainerView()
                .tabItem {
                    Image(systemName: "map")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
