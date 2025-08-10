//
//  HTTPNetworkManager.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 02/06/2025.
//

import Foundation


protocol HTTPNetworkManager {
    func makeNetworkRequest<T: Codable>(urlString: String, type: T.Type, method: String,
                                        body: Data?,
                                        headers: [String: String]) async -> Result<T, APIError>
}

class HTTPRequestManager {
    func requestData(from url: URL, method: String = "GET",
                     body: Data? = nil,
                     headers: [String: String] = [:]) async throws -> Data {
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = body
        
        headers.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        if body != nil && headers["Content-Type"] == nil {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        
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
    
    init(requestManager: HTTPRequestManager) {
        self.requestManager = requestManager
    }
    
    func makeNetworkRequest<T: Codable>(urlString: String, type: T.Type, method: String = "GET",
                                        body: Data? = nil,
                                        headers: [String: String] = [:]) async -> Result<T, APIError> {
        guard let url = URL(string: urlString) else {
            return .failure(.requestFailed(description: "Invalid URL"))
        }
        
        do {
            let data = try await requestManager.requestData(from: url, method: method, body: body, headers: headers)
            if let responseString = String(data: data, encoding: .utf8) {
                print("Response Body:\n\(responseString)")
            } else {
                print("Received data but couldn't decode as UTF-8 string.")
            }
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return .success(decoded)
        } catch let decodingError as DecodingError {
            return .failure(.jsonParsingFailure)
        } catch {
            return .failure(.unknownError(error: error))
        }
    }
    
}
