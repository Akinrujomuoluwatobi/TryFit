//
//  StoreViewModel.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 04/06/2025.
//

import Foundation


@MainActor
class StoreViewModel: ObservableObject {
    
    @Published var cloths: [ClothModel]?
    @Published var errorMessage: String?

    private let service: StoreService = DefaultStoreService()

    func loadUser() async {

        let result = await service.fetchCloths()
        switch result {
        case .success(let cloths):
            self.cloths = cloths
        case .failure(let error):
            self.errorMessage = error.localizedDescription
        }
    }
}
