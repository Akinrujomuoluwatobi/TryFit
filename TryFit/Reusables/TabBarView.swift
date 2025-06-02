//
//  TabBarView.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 30/05/2025.
//
import SwiftUI

struct TabBarView: View {
    var body: some View {
        HStack {
            ForEach(["house", "camera", "bag", "person"], id: \.self) { icon in
                Spacer()
                Image(systemName: icon)
                Spacer()
            }
        }
        .padding()
        .background(Color(.systemGray6))
    }
}
