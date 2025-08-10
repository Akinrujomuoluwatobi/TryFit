//
//  StoreDetailsViewModel.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 05/06/2025.
//

import Foundation
import SwiftUI

@MainActor
class StoreDetailsViewModel: ObservableObject {
    @Published public var selectedImage: UIImage?
    @Published var inferedClothModel: ClothModel?
    @Published var errorMessage: String?
    @Published var showError = false
    
    var selectedPersonModel: ClothModel?
    
    private let service: StoreService = DefaultStoreService()
    
    func inferImage(clothImage: String) async {
        guard let fileName = selectedPersonModel?.fileName else { return }
        let requestBody = [
            "person_image": fileName,
            "cloth_image": clothImage
        ]
        let result = await service.imageInference(requestBody: requestBody)
        switch result {
        case .success(let clothModel):
            self.inferedClothModel = clothModel
        case .failure(let error):
            self.errorMessage = error.customDescription
            self.showError = true
        }
    }
}
