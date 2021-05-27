//
//  MapContainerView.swift
//  SearchComplaints
//
//  Created by matsui kento on 2021/05/26.
//

import SwiftUI

struct MapContainerView: View {
    @ObservedObject var viewModel = FetchViewModel()
    @State var showDetailComplaint: Bool = false
   
    var body: some View {
        MapView(complaints: $viewModel.complaints, showDetailComplaint: $showDetailComplaint)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}
