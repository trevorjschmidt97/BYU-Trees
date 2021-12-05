//
//  TreeView.swift
//  BYU Trees
//
//  Created by Trevor Schmidt on 10/3/21.
//

import SwiftUI
import MapKit
import WebKit
import Kingfisher

struct TreeView: View {
    init(tree: Tree) {
        self.tree = tree
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(tree.Location.Latitude) ?? 0.0,
                                                                        longitude: Double(tree.Location.Longitude) ?? 0.0),
                                         span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        
        UIPageControl.appearance().currentPageIndicatorTintColor = .label
        UIPageControl.appearance().pageIndicatorTintColor = .secondaryLabel// UIColor.black.withAlphaComponent(0.2)
    }
    
    var tree: Tree
    @State private var region: MKCoordinateRegion
    @State private var showAbout = false
    @State private var showLocationDescription = false
    @State private var showTypeDescription = false
    @State private var showLandscapeDescription = false
    @State private var showPests = false
    @State private var showImages = true
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Map
                Map(coordinateRegion: $region)
                    .frame(height: 175)
                
                // Image
                HStack {
                    Spacer()
                    Group {
                        if let image = tree.Images?.first {
                            KFImageView(thumbnailURL: image.URL, imageSize: 200)
                                .shadow(radius: 7)
                        } else {
                            Image(systemName: "leaf")
                                .font(.title)
                                .frame(width: 200, height: 200)
                                .background(Color.white)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .scaledToFill()
                                .shadow(radius: 7)
                        }
                    }
                    Spacer()
                }
                    .offset(y: -120)
                    .padding(.bottom, -120)
                
                // All
                Group {
                    top()
                    about()
                    locationDescription()
                    typeDescription()
                    landscapeDescription()
                    if let Pests = tree.Pests {
                        if Pests.count > 0 {
                            pests()
                        }
                    }
                }
                    .padding(.horizontal)
                
                // Images
                if let images = tree.Images {
                    Divider()
                        NavigationLink {
                            TabView {
                                ForEach(images, id: \.self) { item in
                                    KFImage(URL(string: "https://treetour.byu.edu/\(item.URL)")!)
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                            .tabViewStyle(.page(indexDisplayMode: .automatic))
                            .navigationTitle("\(tree.CommonName) Pictures")
                        } label: {
                            HStack {
                                Text("Images:")
                                    .font(.title3)
                                    .accentColor(.primary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .accentColor(.blue)
                            }
                            .padding(.horizontal)
                        }
                }
                Spacer()
            }
        }
        .navigationTitle("Tree Info")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func top() -> some View {
        VStack(alignment: .leading) {
            Text("\(tree.CommonName.replacingOccurrences(of: "&#39;", with: "’"))")
                .font(.title)
            Text("\(tree.ScientificName.replacingOccurrences(of: "&#39;", with: "’")) (\(tree.Family.replacingOccurrences(of: "&#39;", with: "’")))")
                .font(.subheadline)
                .foregroundColor(.secondary)
            if tree.Description != "" {
                Text("\(tree.Description.replacingOccurrences(of: "&#39;", with: "’"))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    func about() -> some View {
        VStack(alignment: .leading) {
            Divider()
            NavigationLink {
                WebView(html: "<h1>" + tree.Culture + "</h1>")
                    .padding()
                    .navigationTitle("About \(tree.CommonName.replacingOccurrences(of: "&#39;", with: "’"))")
            } label: {
                HStack {
                    Text("About \(tree.CommonName.replacingOccurrences(of: "&#39;", with: "’")):")
                        .font(.title3)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
        }
    }
    
    func locationDescription() -> some View {
        VStack(alignment: .leading) {
            Divider()
            
            NavigationLink {
                WebView(html: "<h1>" + tree.LocationDescription + "</h1>")
                    .padding()
                    .navigationTitle("Location of \(tree.CommonName.replacingOccurrences(of: "&#39;", with: "’"))")
            } label: {
                HStack {
                    Text("Location Description:")
                        .font(.title3)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "chevron.right")
                    
                }
            }
        }
    }
    
    func typeDescription() -> some View {
        VStack(alignment: .leading) {
            Divider()
            
            NavigationLink {
                WebView(html: "<h1>" + tree.TypeDescription + "</h1>")
                    .padding()
                    .navigationTitle("Type Description of \(tree.CommonName.replacingOccurrences(of: "&#39;", with: "’"))")
            } label: {
                HStack {
                    Text("Type Description:")
                        .font(.title3)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "chevron.right")
                    
                }
            }
        }
    }
    
    func landscapeDescription() -> some View {
        VStack(alignment: .leading) {
            Divider()
            
            NavigationLink {
                WebView(html: "<h1><B>Design Features:</B> " + tree.Landscape.DesignFeatures + "<br/>" +
                        "<B>Flower Color:</B> " + tree.Landscape.FlowerColor + "<br/>" +
                        "<B>Flower Time:</B> " + tree.Landscape.FlowerTime + "<br/>" +
                        "<B>Form:</B> " + tree.Landscape.Form + "<br/>" +
                        "<B>Hardiness Zones:</B> " + tree.Landscape.HardinessZones + "<br/>" +
                        "<B>Leaf Color:</B> " + tree.Landscape.LeafColor + "<br/>" +
                        "<B>Leaf Type:</B> " + tree.Landscape.LeafType + "<br/>" +
                        "<B>Light Preferences:</B> " + tree.Landscape.LightPreferences + "<br/>" +
                        "<B>Mature Size:</B> " + tree.Landscape.MatureSize + "<br/>" +
                        "<B>PH:</B> " + tree.Landscape.PH + "<br/>" +
                        "<B>Soil Moisture:</B> " + tree.Landscape.SoilMoisture + "<br/>" +
                        "<B>Special Features:</B> " + tree.Landscape.SpecialFeatures + "<br/>" +
                        "<B>Texture:</B> " + tree.Landscape.Texture + "</h1>")
                    .padding()
                    .navigationTitle("Landscape Description")
            } label: {
                HStack {
                    Text("Landscape Description:")
                        .font(.title3)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
        }
    }
    
    func pests() -> some View {
        VStack(alignment: .leading) {
            Divider()
            NavigationLink {
                WebView(html: "<h1>" + tree.pestHtmlString + "</h1>")
                    .padding()
                    .navigationTitle("Pests of \(tree.CommonName.replacingOccurrences(of: "&#39;", with: "’"))")
            } label: {
                HStack {
                    Text("Pests:")
                        .font(.title3)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
        }
    }
}

struct TreeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TreeView(tree: exampleTree)
        }
    }
}
