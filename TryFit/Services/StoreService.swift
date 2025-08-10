//
//  StoreService.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 02/06/2025.
//

import Foundation

protocol StoreService {
    func fetchCloths() async -> Result<[ClothModel], APIError>
    func fetchPersons() async -> Result<[ClothModel], APIError>
    func imageInference(requestBody: [String: String]) async -> Result<ClothModel, APIError>
}

class DefaultStoreService: StoreService {
    var httpManager: HTTPNetworkManager
    
    init(httpManager: HTTPNetworkManager = DefaultHTTPNetworkManager(requestManager: HTTPRequestManager())) {
        self.httpManager = httpManager
    }
    
    func fetchPersons() async -> Result<[ClothModel], APIError>{
        let urlString = "\(Constants.shared.BASE_URL)/persons"
        return await httpManager.makeNetworkRequest(
            urlString: urlString, type: [ClothModel].self,
            method: "GET",
            body: nil,
            headers: [:]
        )
    }
    
    func fetchCloths() async -> Result<[ClothModel], APIError>{
        let urlString = "\(Constants.shared.BASE_URL)/images"
        return await httpManager.makeNetworkRequest(
            urlString: urlString, type: [ClothModel].self,
            method: "GET",
            body: nil,
            headers: [:]
        )
    }
    
    func imageInference(requestBody: [String: String]) async -> Result<ClothModel, APIError>{
        let urlString = "\(Constants.shared.BASE_URL)/tryon"
        let requestBodyData = try? JSONSerialization.data(withJSONObject: requestBody)
        return await httpManager.makeNetworkRequest(
            urlString: urlString, type: ClothModel.self,
            method: "POST",
            body: requestBodyData,
            headers: [:]
        )
    }
}
