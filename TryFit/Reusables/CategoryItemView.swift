//
//  CategoryItemView.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 04/06/2025.
//
import SwiftUI


struct CategoryItemView: View {
    let clothModel: ClothModel
    @State private var loaded = false
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: clothModel.imgURL)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150)
                        .clipped()
                        .cornerRadius(10)
                        .opacity(loaded ? 1 : 0)
                        .animation(.easeIn(duration: 0.5), value: loaded)
                        .onAppear { loaded = true }
                } else if phase.error != nil {
                    Color.gray
                        .frame(height: 150)
                        .cornerRadius(10)
                } else {
                    ProgressView()
                        .frame(height: 150)
                }
            }
            Text(clothModel.fileName)
        }
        .padding(5)
    }
}
