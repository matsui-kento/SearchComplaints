//
//  AddComplaintView.swift
//  SearchComplaints
//
//  Created by matsui kento on 2021/05/26.
//

import SwiftUI
import MapKit

struct AddComplaintView: View {
    @ObservedObject var viewModel = AddViewModel()
    @State private var placeholderText = "苦情を入力してください"
    @State var address = ""
    @State var complaint = "苦情を入力してください"
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                Spacer()
                
                TextField(" 住所を入力してください", text: $address)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                
                Rectangle()
                    .frame(height: 1)
                    .padding(.bottom)
                
                
                TextEditor(text: $complaint)
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .lineLimit(3)
                    .foregroundColor((complaint == "苦情を入力してください") ? .gray : .black)
                    .onTapGesture {
                        if complaint == "苦情を入力してください" {
                            complaint = ""
                        }
                    }
                
                Rectangle()
                    .frame(height: 1)
                
                Spacer()
                
                if !(complaint == "苦情を入力してください") &&
                    !(address.isEmpty || complaint.isEmpty) {
                    
                    Button(action: {
                        CLGeocoder().geocodeAddressString(address) { placemarks, error in
                            guard let latitude = placemarks?.first?.location?.coordinate.latitude else { return }
                            guard let longitude = placemarks?.first?.location?.coordinate.longitude else { return }
                            viewModel.addComplaint(latitude: latitude,
                                                   longitude: longitude,
                                                   complaint: complaint,
                                                   address: address)
                            address = ""
                            complaint = ""
                        }
                    }, label: {
                        Text("追加する")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 340, height: 50)
                            .background(Color.black)
                            .clipShape(Capsule())
                            .padding()
                    })
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("苦情を追加する")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct AddComplaintView_Previews: PreviewProvider {
    static var previews: some View {
        AddComplaintView()
    }
}

