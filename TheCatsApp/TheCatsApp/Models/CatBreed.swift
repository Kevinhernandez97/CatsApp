//
//  CatBreed.swift
//  TheCatsApp
//
//  Created by Kevin Hernandez on 20/06/23.
//

import Foundation

struct CatBreed: Identifiable, Codable {
    let id: String
    let name: String
    let origin: String
    let intelligence: Int
    let referenceImageId: String
}
