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
    
    func fetchUsers() -> AnyPublisher<Users, Error> {
        return provider.requestPublisher(.users)
            .map(Users.self)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func fetchAlbums(userID: Int) -> AnyPublisher<Albums, Error> {
        return provider.requestPublisher(.albums(userID: userID))
            .map(Albums.self)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func fetchPhotos(albumID: Int) -> AnyPublisher<Photos, Error> {
        return provider.requestPublisher(.photos(albumID: albumID))
            .map([Photo].self)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
