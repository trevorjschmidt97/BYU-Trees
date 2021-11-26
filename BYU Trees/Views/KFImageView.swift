//
//  KFImageView.swift
//  BYU Trees
//
//  Created by Trevor Schmidt on 10/3/21.
//

import SwiftUI
import Kingfisher

struct KFImageView: View {
    var thumbnailURL: String
    var imageSize: CGFloat
    var body: some View {
        
        if #available(iOS 15.0, *) {
            AsyncImage(url: URL(string:"https://treetour.byu.edu/\(thumbnailURL)")) { downloadedImage in
                downloadedImage
                    .resizable()
                    .frame(width: imageSize, height: imageSize)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "leaf")
                    .frame(width: imageSize, height: imageSize)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .scaledToFill()
            }
        } else {
            KFImage(URL(string: "https://treetour.byu.edu/\(thumbnailURL)")!)
                .placeholder({
                    Image(systemName: "leaf")
                        .frame(width: imageSize, height: imageSize)
                        .background(Color.white)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .scaledToFill()
                })
                .resizable()
                .frame(width: imageSize, height: imageSize)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .scaledToFill()
        }
            
    }
}

//struct KFImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        KFImageView()
//    }
//}
