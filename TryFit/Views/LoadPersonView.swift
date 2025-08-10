//
//  LoadPersonView.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 09/06/2025.
//

import SwiftUI

struct LoadPersonView: View {
    
    @StateObject private var storeViewModel = PersonViewModel()
    @Environment(\.dismiss) var dismiss
    var onImageSelect: ((ClothModel) -> Void)
    
    var body: some View {
        VStack(spacing: 10, content: {
            Text("Select an Image of you to try on")
                .font(.title3)
                .fontWeight(.bold)
            
            Spacer()
            
            if let persons = storeViewModel.persons {
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(persons) { personModel in
                            CategoryItemView(clothModel: personModel)
                                .padding(5)
                                .onTapGesture {
                                    onImageSelect(personModel)
                                    dismiss()
                                }
                        }
                    }
                    .padding(.horizontal)
                }
            } else {
                ProgressView("Loading...")
                    .frame(maxWidth: .infinity)
            }
            
        })
        .padding(.vertical)
        .task {
            await storeViewModel.fetchPersons()
        }.sheet(isPresented: $storeViewModel.showError) {
            ErrorSheetView(message: storeViewModel.errorMessage ?? "") {
                storeViewModel.showError = false
            }
        }
    }
}

#Preview {
    LoadPersonView { _ in
        
    }
}
