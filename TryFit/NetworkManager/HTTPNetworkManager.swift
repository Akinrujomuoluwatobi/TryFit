//
//  HTTPNetworkManager.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 02/06/2025.
//

import Foundation


protocol HTTPNetworkManager {
    func makeNetworkRequest<T: Codable>(urlString: String, type: T.Type, completion:  @escaping(Result<T, APIError>) -> Void)
}

class DefaultHTTPNetworkManager: HTTPNetworkManager {
    func makeNetworkRequest<T: Codable>(urlString: String, type: T.Type, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.unknownError(error: error)))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed(description: "Request Failed")))
                return
            }
            
            guard response.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: response.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(.success(model.self))
            } catch {
                completion(.failure(.jsonParsingFailure))
            }
            
        }.resume()
    }
    
}
