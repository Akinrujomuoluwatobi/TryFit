//
//  ClothModel.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 02/06/2025.
//
import Foundation

// MARK: - ClothModelElement
struct ClothModel: Codable, Identifiable {
    let id = UUID()
    let imgURL: String
    let fileName: String

    enum CodingKeys: String, CodingKey {
        case imgURL = "img_url"
        case fileName = "file_name"
    }
}
