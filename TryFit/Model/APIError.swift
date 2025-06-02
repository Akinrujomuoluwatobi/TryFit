//
//  APIError.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 02/06/2025.
//

import Foundation

enum APIError: Error {
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData: return "Invalid Data"
        case .jsonParsingFailure: return "Error trying to parse JSON Data"
        case let .requestFailed(description): return "Failed Request: \(description)"
        case let .invalidStatusCode(statusCode): return "Invalid Status Code: \(statusCode)"
        case let .unknownError(error): return "Unknown Error Occured: \(error.localizedDescription)"
        }
    }
}
