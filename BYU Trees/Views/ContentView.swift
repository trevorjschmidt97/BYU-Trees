//
//  ContentView.swift
//  BYU Trees
//
//  Created by Trevor Schmidt on 11/18/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            if #available(iOS 15.0, *) {
                NavigationView {
                    SearchableListView()
                }
                    .tabItem {
                        Label("List", systemImage: "list.dash")
                    }
                    .tag(0)
            } else {
                NavigationView {
                    ListView()
                }
                    .tabItem {
                        Label("List", systemImage: "list.dash")
                    }
                    .tag(0)
            }
            
            NavigationView {
                MapView()
            }
                .tabItem {
                    Label("Map", systemImage: "map")
                }
                .tag(1)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
