//
//  BYU_TreesApp.swift
//  BYU Trees
//
//  Created by Trevor Schmidt on 10/6/21.
//

import SwiftUI
//import Firebase

@main
struct BYU_TreesApp: App {
    
//    init() {
//        FirebaseApp.configure()
//    }
    
    @StateObject var viewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .onAppear {
                    viewModel.onAppear()
                }
        }
    }
}
