//
//  Albums.swift
//  GalleryApp
//
//  Created by Mohamed Ayman on 18/11/2024.
//

import Foundation

struct Album: Codable {
    let userID, id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}

typealias Albums = [Album]
