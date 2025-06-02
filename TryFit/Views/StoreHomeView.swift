//
//  ContentView.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 30/05/2025.
//

import SwiftUI

struct StoreHomeView: View {
    var body: some View {
        TabView {
            
            StoreView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("Favourites")
                .tabItem {
                    Label("favourites", systemImage: "heart.fill")
                }
            
            Text("Profiles")
                .tabItem {
                    Label("profile", systemImage: "person")
                }
        }
    }
}


#Preview {
    StoreHomeView()
}
