//
//  StoreService.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 02/06/2025.
//

import Foundation

protocol StoreService {
    func fetchCloths() async -> Result<[ClothModel], APIError>
}

class DefaultStoreService: StoreService {
    var httpManager: HTTPNetworkManager
    
    init(httpManager: DefaultHTTPNetworkManager = DefaultHTTPNetworkManager()) {
        self.httpManager = httpManager
    }

    func fetchCloths() async ->  Result<[ClothModel], APIError>{
        let urlString = ""
        return await httpManager.makeNetworkRequest(urlString: urlString, type: [ClothModel].self)
    }
    
}
