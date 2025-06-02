//
//  StoreService.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 02/06/2025.
//

import Foundation

protocol StoreService {
    func fetchCloths(completion: @escaping(Result<[ClothModel], APIError>) -> Void)
}

class DefaultStoreService: StoreService {
    
    var httpManager: HTTPNetworkManager
    
    init(httpManager: DefaultHTTPNetworkManager = DefaultHTTPNetworkManager()) {
        self.httpManager = httpManager
    }
    
    func fetchCloths(completion: @escaping(Result<[ClothModel], APIError>) -> Void) {
        let urlString = ""
        httpManager.makeNetworkRequest(urlString: urlString, type: [ClothModel].self) { result in
            completion(result)
        }
    }
    
}
