//
//  AppViewModel.swift
//  BYU Trees
//
//  Created by Trevor Schmidt on 10/6/21.
//

import Foundation

class AppViewModel: ObservableObject {
    @Published var trees: [Tree] = []
    
    var DatabaseService: DatabaseService = NetworkService.shared
    
    func onAppear() {
        // Create url to data in the filesystem
        if let treesDocumentUrl: URL = try? FileManager.default.url(
            for: FileManager.SearchPathDirectory.documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        ).appendingPathComponent("trees.data") {
            // If data exists there
            if let data = try? Data(contentsOf: treesDocumentUrl) {
                // try to decode it
                let decoder = JSONDecoder()
                if let trees = try? decoder.decode([Tree].self, from: data) {
                    // then set it as the trees
                    let sortedTrees = trees.sorted { $0.CommonName < $1.CommonName }
                    self.trees = sortedTrees.filter { $0.CommonName != "Red Twig Dogwood (SHRUB)" && $0.CommonName != "English Walnut" }
                }
            }
        }
        
        // Then make the call to the db
        DatabaseService.pullTrees { [weak self] treesData in
            // make sure we get data back
            guard let treesData = treesData else { return }
            
            // decode it
            let decoder = JSONDecoder()
            let trees = try? decoder.decode([Tree].self, from: treesData)
            
            // If decoded
            if let trees = trees {
                // Sort the trees
                let sortedTrees = trees.sorted { t1, t2 in
                    t1.CommonName < t2.CommonName
                }
                let cleanedTrees = sortedTrees.filter { $0.CommonName != "Red Twig Dogwood (SHRUB)" && $0.CommonName != "English Walnut" }
                
                // Then try to write the trees to the filesystem
                if let treesDocumentUrl: URL = try? FileManager.default.url(
                    for: FileManager.SearchPathDirectory.documentDirectory,
                    in: .userDomainMask,
                    appropriateFor: nil,
                    create: true
                ).appendingPathComponent("trees.data") {
                    try? treesData.write(to: treesDocumentUrl)
                }
                
                // then set the trees to the published var
                DispatchQueue.main.async {
                    self?.trees = cleanedTrees
                }
            }
        }
    }
}
