//
//  Photos.swift
//  GalleryApp
//
//  Created by Mohamed Ayman on 18/11/2024.
//

import Foundation

struct Photo: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

typealias Photos = [Photo]

