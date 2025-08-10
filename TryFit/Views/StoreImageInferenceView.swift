//
//  StoreImageInferenceView.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 05/06/2025.
//

import SwiftUI

struct StoreImageInferenceView: View {
    @State private var loaded = false
    var clothModel: ClothModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                AsyncImage(url: URL(string: clothModel.imgURL)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .cornerRadius(10)
                            .opacity(loaded ? 1 : 0)
                            .animation(.easeIn(duration: 0.5), value: loaded)
                            .onAppear { loaded = true }
                    } else if phase.error != nil {
                        Color.gray
                            .cornerRadius(10)
                    } else {
                        ProgressView()
                            .frame(maxHeight: .infinity)
                    }
                }.padding(.top, 40)
                
                Spacer()
                
                Button(action: {}) {
                    Text("Buy Now")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pink)
                        .cornerRadius(10)
                }
                .padding(.top)
                
            }
            .padding()
            
        }
        .ignoresSafeArea(.container, edges: .bottom)
    }
}

#Preview {
    StoreImageInferenceView(clothModel: ClothModel(imgURL: "", fileName: ""))
}
