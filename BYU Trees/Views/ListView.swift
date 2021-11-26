//
//  ListView.swift
//  BYU Trees
//
//  Created by Trevor Schmidt on 10/3/21.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    struct ListViewConstants {
        static var imageSize: CGFloat = 80
    }
    
    var body: some View {
        List {
            ForEach(viewModel.trees) { tree in
                
                let commonName = tree.CommonName.replacingOccurrences(of: "&#39;", with: "’")
                let scientificName = tree.ScientificName.replacingOccurrences(of: "&#39;", with: "’")
                let familyName = tree.Family.replacingOccurrences(of: "&#39;", with: "’")
                NavigationLink {
                    TreeView(tree: tree)
                } label: {
                    HStack {
                        Group {
                            if let image = tree.Images?.first {
                                KFImageView(thumbnailURL: image.ThumbnailURL, imageSize: ListViewConstants.imageSize)
                            } else {
                                Image(systemName: "leaf")
                                    .font(.title)
                                    .frame(width: ListViewConstants.imageSize, height: ListViewConstants.imageSize)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                    .scaledToFill()
                            }
                        }
                        .shadow(radius: 7)
                        .padding(.trailing)
                        VStack(alignment: .leading) {
                            Text("\(commonName)")
                            Text("\(scientificName) (\(familyName))")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
            }
        }
        .navigationTitle("BYU Trees")
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}
