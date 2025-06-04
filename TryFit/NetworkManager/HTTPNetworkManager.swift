//
//  HTTPNetworkManager.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 02/06/2025.
//

import Foundation


protocol HTTPNetworkManager {
    func makeNetworkRequest<T: Codable>(urlString: String, type: T.Type) async -> Result<T, APIError>
}

class HTTPRequestManager {
    func requestData(from url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }
        
        return data
    }
}

class DefaultHTTPNetworkManager: HTTPNetworkManager {
    
    private let requestManager: HTTPRequestManager
    
    init(requestManager: HTTPRequestManager = HTTPRequestManager()) {
        self.requestManager = requestManager
    }
    
    func makeNetworkRequest<T: Codable>(urlString: String, type: T.Type) async -> Result<T, APIError> {
        guard let url = URL(string: urlString) else {
            return .failure(.requestFailed(description: "Invalid URL"))
        }
        
        do {
            let data = try await requestManager.requestData(from: url)
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return .success(decoded)
        } catch let decodingError as DecodingError {
            return .failure(.jsonParsingFailure)
        } catch {
            return .failure(.unknownError(error: error))
        }
    }
    
}
