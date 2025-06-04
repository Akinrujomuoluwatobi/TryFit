//
//  CategoryItemView.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 04/06/2025.
//
import SwiftUI


struct CategoryItemView: View {
    let cloth: ClothModel
    @State private var loaded = false
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: cloth.imageUrl)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 100)
                        .clipped()
                        .cornerRadius(10)
                        .opacity(loaded ? 1 : 0)
                        .animation(.easeIn(duration: 0.5), value: loaded)
                        .onAppear { loaded = true }
                } else if phase.error != nil {
                    Color.gray
                        .frame(height: 100)
                        .cornerRadius(10)
                } else {
                    ProgressView()
                        .frame(height: 100)
                }
            }
            Text(cloth.name)
        }
        .padding(5)
    }
}
