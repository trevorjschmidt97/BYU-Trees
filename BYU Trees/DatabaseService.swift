//
//  DatabaseService.swift
//  BYU Trees
//
//  Created by Trevor Schmidt on 11/4/21.
//

import Foundation
//import FirebaseDatabase
//import CodableFirebase

protocol DatabaseService {
    func pullTrees(completion: @escaping(Data?) -> Void)
}

struct NetworkService: DatabaseService {
    private init() { }
    static var shared = NetworkService()
    
    func pullTrees(completion: @escaping(Data?) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "https://treetour.byu.edu/API/Trees/?fullData=true")!) {(data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(data)
        }.resume()
    }
}

//struct FirebaseDatabaseService: DatabaseService {
//    private init() { }
//    static var shared = FirebaseDatabaseService()
//    
//    private let rootRef = Database.database().reference()
//    
//    private struct Key {
//        static let trees = "trees"
//    }
//    
//    func pullTrees(completion: @escaping (Data?) -> Void) {
//        rootRef.child(Key.trees).observe(.value) { snapshot in
//            guard let value = snapshot.value as? Data else {
//                completion(nil)
//                return }
//            completion(value)
//        }
//    }
//}
