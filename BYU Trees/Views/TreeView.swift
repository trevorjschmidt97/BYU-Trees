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
        UIPageControl.appearance().pageIndicatorTintColor = .secondaryLabel
    }
    
    var tree: Tree
    @State private var region: MKCoordinateRegion
    @State private var showAbout = false
    @State private var showLocationDescription = false
    @State private var showTypeDescription = false
    @State private var showLandscapeDescription = false
    @State private var showPests = false
    
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
                            pests(pests: Pests)
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
                                        .placeholder({
                                            ProgressView()
                                        })
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
            Text(.init(tree.CommonName.htmlToMarkup()))
                .font(.title)
            Text("\(tree.ScientificName.htmlToMarkup()) (\(tree.Family.htmlToMarkup()))")
                .font(.subheadline)
                .foregroundColor(.secondary)
            if tree.Description != "" {
                Text("\(tree.Description.htmlToMarkup())")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    func about() -> some View {
        VStack(alignment: .leading) {
            Divider()
            HStack {
                Text("About \(tree.CommonName.htmlToMarkup()):")
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
                Text(.init(tree.Culture.htmlToMarkup()))
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
                Text(.init(tree.LocationDescription.htmlToMarkup()))
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
                Text(.init(tree.TypeDescription.htmlToMarkup()))
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
                Text(.init(tree.landscapeHtmlString))
                    .font(.body)
            }
            
        }
    }
    
    func pests(pests: [TreePest]) -> some View {
        VStack(alignment: .leading) {
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
                    Text(.init(tree.pestHtmlString))
                        .font(.body)
                }
            }
        }
    }
}

struct OldTreeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TreeView(tree: exampleTree)
        }
    }
}
