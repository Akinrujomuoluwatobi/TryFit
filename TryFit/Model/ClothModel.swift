//
//  ClothModel.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 02/06/2025.
//
import Foundation

class ClothModel: Codable, Identifiable {
    let id = UUID()
    var imageUrl: String
    var name: String
}
