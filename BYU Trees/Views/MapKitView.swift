//
//  MapKitView.swift
//  BYU Trees
//
//  Created by Trevor Schmidt on 12/2/21.
//

import SwiftUI
import MapKit

struct MapKitView: UIViewRepresentable {
    var trees: [Tree]
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.mapType = .satellite
        mapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.248893267047094,
                                                                           longitude: -111.64944461206474),
                                            span: MKCoordinateSpan(latitudeDelta: 0.0089720554688665857,
                                                                   longitudeDelta: 0.0084573618005945264))
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // nothing yet
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var parent: MapKitView
        
        init(_ parent: MapKitView) {
            self.parent = parent
        }
        
        //MARK: - Custom Annotation
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let reuseIdentifier = "pin"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)

            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
                annotationView?.canShowCallout = true
            } else {
                annotationView?.annotation = annotation
            }

//            let customPointAnnotation = annotation as! CustomPointAnnotation
//            annotationView?.image = UIImage(named: customPointAnnotation.pinCustomImageName)

            return annotationView
        }
    }
}

