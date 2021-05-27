//
//  MapView.swift
//  SearchComplaints
//
//  Created by matsui kento on 2021/05/27.
//

import SwiftUI
import MapKit
import UIKit

struct MapView: UIViewRepresentable {
    
    @Binding var complaints: [Complaint]
    @Binding var showDetailComplaint: Bool
    
    class Coordinator: NSObject, MKMapViewDelegate {
        let parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            
        }
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        var allAnnotations: [ComplaintAnnotation] = []
        for complaint in complaints {
            let title = complaint.address
            let subtitle = complaint.complaint
            let coordinate = CLLocationCoordinate2D(latitude: complaint.latitude, longitude: complaint.longitude)
            allAnnotations.append(ComplaintAnnotation(title: title, subtitle: subtitle, coordinate: coordinate))
        }
        
        uiView.annotations.forEach { uiView.removeAnnotation($0) }
        uiView.addAnnotations(allAnnotations)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

class ComplaintAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}

