//
//  MapView.swift
//  BYU Trees
//
//  Created by Trevor Schmidt on 10/3/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        Map(coordinateRegion: $locationManager.region, showsUserLocation: true, annotationItems: viewModel.trees) { tree in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double(tree.Location.Latitude) ?? 0.0,
                                                             longitude: Double(tree.Location.Longitude) ?? 0.0),
                          anchorPoint: CGPoint(x: 0.5, y: 0.5)) {

                NavigationLink {
                    TreeView(tree: tree)
                } label: {
                    if let imageUrl = tree.Images?.first {
                        KFImageView(thumbnailURL: imageUrl.URL, imageSize: 50)
                    }
                }
            }
        }
            .edgesIgnoringSafeArea(.top)
    }
}

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.248893267047094,
                                                                                  longitude: -111.64944461206474),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.0029720554688665857,
                                                                          longitudeDelta: 0.0024573618005945264))
    
    private var manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
}

