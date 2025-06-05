//
//  ClothDetailView.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 30/05/2025.
//

import SwiftUI

struct ClothDetailView: View {
    var clothModel: ClothModel
    let sizes = ["XS", "S", "M", "L", "XL"]
    @State private var loaded = false
    
    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false
    @State private var showSheet = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack(spacing: 0) {
            
            Spacer()
            AsyncImage(url: URL(string: clothModel.imgURL)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 400)
                        .clipped()
                        .cornerRadius(10)
                        .opacity(loaded ? 1 : 0)
                        .animation(.easeIn(duration: 0.5), value: loaded)
                        .onAppear { loaded = true }
                } else if phase.error != nil {
                    Color.gray
                        .frame(height: 300)
                        .cornerRadius(10)
                } else {
                    ProgressView()
                        .frame(height: 300)
                }
            }.padding(.top, 40)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Floral Print Maxi Dress")
                    .font(.title3)
                    .bold()
                Text("This elegant maxi dress features a vibrant floral print, perfect for any occasion. Made from lightweight fabric, it offers both style and comfort.")
                    .font(.body)
                    .foregroundColor(.gray)
                
                Text("Size")
                    .font(.headline)
                    .padding(.top)
                
                HStack {
                    ForEach(sizes, id: \.self) { size in
                        Text(size)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color(.systemGray5))
                            .cornerRadius(8)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    showSheet = true
                }) {
                    Text("Try it on")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pink)
                        .cornerRadius(10)
                }
                .padding(.top)
            }
            .padding()
            .confirmationDialog("Select Image Source", isPresented: $showSheet, titleVisibility: .visible) {
                Button("Camera") {
                    sourceType = .camera
                    showImagePicker = true
                }
                Button("Gallery") {
                    sourceType = .photoLibrary
                    showImagePicker = true
                }
                Button("Cancel", role: .cancel) { }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(sourceType: sourceType, selectedImage: $selectedImage)
            }
        }
    }
}

#Preview {
    ClothDetailView(clothModel: ClothModel(imgURL: "", fileName: ""))
}
