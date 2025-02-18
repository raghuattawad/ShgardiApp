//
//  Model.swift
//  ShgardiApp
//
//  Created by Raghavendra Dattawad on 18/02/25.
//

import Foundation
// Modal class

struct Person: Codable, Identifiable {
    let id: Int
    let name: String
    let profile_path: String?
    let biography: String? // Add this field for biography or description
}

