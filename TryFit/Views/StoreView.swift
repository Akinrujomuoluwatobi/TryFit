//
//  StoreView.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 30/05/2025.
//

import SwiftUI

struct StoreView: View {
    
    @State private var storeViewModel = StoreViewModel()
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack {
                    Text("Shop")
                        .font(.title)
                        .bold()
                    Spacer()
                    Image(systemName: "slider.horizontal.3")
                }
                .padding()
                
                SearchBarView()
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(["All", "Dresses", "Tops", "Bottoms", "Outerwear"], id: \.self) { category in
                            Text(category)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Featured")
                        .font(.headline)
                        .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(["New Arrivals", "Summer Collection"], id: \.self) { title in
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(.systemGray5))
                                    .frame(width: 140, height: 180)
                                    .overlay(Text(title).padding(.bottom, 10), alignment: .bottom)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Text("Categories")
                        .font(.headline)
                        .padding(.horizontal)
                        .padding(.top)
                    if let cloths = storeViewModel.cloths {
                        LazyVGrid(columns: [GridItem(), GridItem()]) {
                            ForEach(cloths) { category in
                                CategoryItemView(cloth: category)
                                    .padding(5)
                            }
                        }
                        .padding(.horizontal)
                    } else {
                        ProgressView("Loading...")
                    }
                    
                }
                
            }
            
        }
    }
}

#Preview {
    StoreView()
}
