//
//  NetworkManager.swift
//  GalleryApp
//
//  Created by Mohamed Ayman on 18/11/2024.
//

import Foundation
import Moya
import Combine
import CombineMoya

class NetworkManager {
    static let shared = NetworkManager()
    private let provider = MoyaProvider<GalleryService>()
    
    private init() {}
    
    func fetchUsers() -> AnyPublisher<Users, MoyaError> {
        return provider.requestPublisher(.users)
            .map(Users.self)
            .eraseToAnyPublisher()
    }
    
    func fetchAlbums(userID: Int) -> AnyPublisher<Albums, MoyaError> {
        return provider.requestPublisher(.albums(userID: userID))
            .map(Albums.self)
            .eraseToAnyPublisher()
    }
    
    func fetchPhotos(albumID: Int) -> AnyPublisher<Photos, MoyaError> {
        return provider.requestPublisher(.photos(albumID: albumID))
            .map([Photo].self)
            .eraseToAnyPublisher()
    }
}
