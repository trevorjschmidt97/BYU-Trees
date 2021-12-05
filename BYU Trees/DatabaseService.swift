//
//  DatabaseService.swift
//  BYU Trees
//
//  Created by Trevor Schmidt on 11/4/21.
//

import Foundation

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
