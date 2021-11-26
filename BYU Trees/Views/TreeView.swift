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
                    pests()
                }
                    .padding(.horizontal)
                
                // Images
                if let images = tree.Images {
                    Divider()
//                    HStack {
//                        Text("Images:")
//                            .font(.title3)
//                        Spacer()
                        NavigationLink {
                            TabView {
                                ForEach(images, id: \.self) { item in
                                    KFImage(URL(string: "https://treetour.byu.edu/\(item.URL)")!)
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
//                            .frame(height: 600)
//                            .padding(.horizontal)
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

//                        Button {
//                            withAnimation {
//                                showImages.toggle()
//                            }
//                        } label: {
//                            Image(systemName: showImages ? "chevron.down" : "chevron.up")
//                        }
//                    }
//                    .padding(.horizontal)
//                    if showImages {
//                        TabView {
//                            ForEach(images, id: \.self) { item in
//                                KFImage(URL(string: "https://treetour.byu.edu/\(item.URL)")!)
//                                    .resizable()
//                                    .scaledToFit()
//                            }
//                        }
//                        .frame(height: 600)
//                        .padding(.horizontal)
//                        .background(Color.secondary)
////                        .tabViewStyle(.page(indexDisplayMode: .always))
//                        .tabViewStyle(.page(indexDisplayMode: .automatic))
//                    }
                }
                
                
                Spacer()
            }
        }
        .navigationTitle("Tree Info")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func top() -> some View {
        VStack(alignment: .leading) {
            Text("\(tree.CommonName)")
                .font(.title)
            Text("\(tree.ScientificName) (\(tree.Family))")
                .font(.subheadline)
                .foregroundColor(.secondary)
            if tree.Description != "" {
                Text("\(tree.Description)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    func about() -> some View {
        VStack(alignment: .leading) {
            Divider()
            HStack {
                Text("About \(tree.CommonName):")
                    .font(.title3)
                Spacer()
                Button {
                    withAnimation {
                        showAbout.toggle()
                    }
                } label: {
                    Image(systemName: showAbout ? "chevron.down" : "chevron.up")
                }
            }
            if showAbout {
//                WebView(text: tree.Culture)
//                HTMLStringView(htmlContent: tree.Culture)
                Text("\(tree.Culture.html2markup())")
                    .font(.body)
            }
            
        }
    }
    
    func locationDescription() -> some View {
        VStack(alignment: .leading) {
            Divider()
            HStack {
                Text("Location Description:")
                    .font(.title3)
                Spacer()
                Button {
                    withAnimation {
                        showLocationDescription.toggle()
                    }
                } label: {
                    Image(systemName: showLocationDescription ? "chevron.down" : "chevron.up")
                }
            }
            if showLocationDescription {
                Text("\(tree.LocationDescription)")
                    .font(.body)
            }
            
        }
    }
    
    func typeDescription() -> some View {
        VStack(alignment: .leading) {
            Divider()
            HStack {
                Text("Type Description:")
                    .font(.title3)
                Spacer()
                Button {
                    withAnimation {
                        showTypeDescription.toggle()
                    }
                } label: {
                    Image(systemName: showTypeDescription ? "chevron.down" : "chevron.up")
                }
            }
            if showTypeDescription {
                Text("\(tree.TypeDescription)")
                    .font(.body)
            }
            
        }
    }
    
    func landscapeDescription() -> some View {
        VStack(alignment: .leading) {
            Divider()
            HStack {
                Text("Landscape Description:")
                    .font(.title3)
                Spacer()
                Button {
                    withAnimation {
                        showLandscapeDescription.toggle()
                    }
                } label: {
                    Image(systemName: showLandscapeDescription ? "chevron.down" : "chevron.up")
                }
            }
            if showLandscapeDescription {
                Group {
                    Text("Design Features: \(tree.Landscape.DesignFeatures)")
                    Text("Flower Color: \(tree.Landscape.FlowerColor)")
                    Text("Flower Time: \(tree.Landscape.FlowerTime)")
                    Text("Form: \(tree.Landscape.Form)")
                    Text("Hardiness Zones: \(tree.Landscape.HardinessZones)")
                    Text("Leaf Color: \(tree.Landscape.LeafColor)")
                    Text("Leaf Type: \(tree.Landscape.LeafType)")
                    Text("Light Preferences: \(tree.Landscape.LightPreferences)")
                    Text("Mature Size: \(tree.Landscape.MatureSize)")
                    Text("PH: \(tree.Landscape.PH)")
                }
                    .font(.body)
            }
            if showLandscapeDescription {
                Text("Soil Moisture: \(tree.Landscape.SoilMoisture)")
                    .font(.body)
                Text("Special Features: \(tree.Landscape.SpecialFeatures)")
                    .font(.body)
                Text("Texture: \(tree.Landscape.Texture)")
                    .font(.body)
            }
            
        }
    }
    
    func pests() -> some View {
        VStack(alignment: .leading) {
            if let pests = tree.Pests {
                if pests.count > 0 {
                
                    VStack(alignment: .leading) {
                        Divider()
                        HStack {
                            Text("Pests:")
                                .font(.title3)
                            Spacer()
                            Button {
                                withAnimation {
                                    showPests.toggle()
                                }
                            } label: {
                                Image(systemName: showPests ? "chevron.down" : "chevron.up")
                            }
                        }
                        if showPests {
                            ForEach(pests) { pest in
                                Text("\(pest.CommonName):")
                                Text("Scientific Name: \(pest.ScientificName)")
                                Text("Treatment: \(pest.Treatment)")
                                Text("Prevention: \(pest.Prevention)")
                                Text("Other Info: \(pest.OtherInfo)\n")
                            }
                        }
                    }
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
