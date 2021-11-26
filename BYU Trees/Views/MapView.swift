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
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.248893267047094,
                                                                                  longitude: -111.64944461206474),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.0029720554688665857,
                                                                          longitudeDelta: 0.0024573618005945264))
    @State private var showingSettings = false
    @State private var action: Int? = 0
    
    init() {
        MKMapView.appearance().mapType = .hybrid
    }
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: viewModel.trees) { tree in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double(tree.Location.Latitude) ?? 0.0,
                                                             longitude: Double(tree.Location.Longitude) ?? 0.0),
                          anchorPoint: CGPoint(x: 0.5, y: 0.5)) {

                NavigationLink {
                    TreeView(tree: tree)
                } label: {
                    if let imageUrl = tree.Images?.first {
                        KFImageView(thumbnailURL: imageUrl.URL, imageSize: 50)
                    } else {
                        Image(systemName: "map")
                            .frame(width: 50, height: 50)
                            .background(Color.white)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.secondary, lineWidth: 2))
                            .scaledToFill()
                            .onAppear {
                                print(tree.CommonName)
                            }
                    }
                }

            }

        }
            .onAppear {
                MKMapView.appearance().mapType = .hybrid
            }
            .edgesIgnoringSafeArea(.top)
            
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
