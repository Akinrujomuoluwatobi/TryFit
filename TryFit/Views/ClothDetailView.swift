//
//  ClothDetailView.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 30/05/2025.
//

import SwiftUI

struct ClothDetailView: View {
    let sizes = ["XS", "S", "M", "L", "XL"]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "chevron.left")
                    .padding()
                Spacer()
            }
            
            Spacer()
            Image(systemName: "person.fill") // Placeholder for dress preview
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
                .padding(.top, 20)
            
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
                
                Button(action: {}) {
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
            
            Spacer()
            TabBarView()
        }
    }
}

#Preview {
    ClothDetailView()
}
