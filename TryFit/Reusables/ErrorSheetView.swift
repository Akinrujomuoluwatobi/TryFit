//
//  ErrorSheetView.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 04/06/2025.
//
import SwiftUI

struct ErrorSheetView: View {
    let message: String
    let onDismiss: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Error")
                .font(.title2)
                .bold()
            
            Text(message)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
            
            Button("Dismiss") {
                onDismiss()
            }
            .padding(.top)
        }
        .padding()
        .presentationDetents([.fraction(0.3)])
    }
}
