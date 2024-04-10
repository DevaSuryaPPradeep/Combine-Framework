//
//  Model.swift
//  Timer bootcamp
//
//  Created by Devasurya on 07/04/24.
//

import Foundation

struct Model: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}
