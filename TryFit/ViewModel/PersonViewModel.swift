//
//  PersonViewModel.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 09/06/2025.
//

import Foundation

@MainActor
class PersonViewModel: ObservableObject {
    
    @Published var persons: [ClothModel]?
    @Published var errorMessage: String?
    @Published var showError = false

    private let service: StoreService = DefaultStoreService()

    func fetchPersons() async {
        let result = await service.fetchPersons()
        switch result {
        case .success(let cloths):
            self.persons = cloths
        case .failure(let error):
            self.showError = true
            self.errorMessage = error.customDescription
            
        }
    }
}
