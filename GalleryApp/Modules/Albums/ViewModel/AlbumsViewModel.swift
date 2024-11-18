//
//  AlbumsViewModel.swift
//  GalleryApp
//
//  Created by Mohamed Ayman on 18/11/2024.
//

import Foundation
import Combine

class AlbumsViewModel {
    @Published var user: User?
    @Published var albums: Albums = []
    private var cancellables = Set<AnyCancellable>()
    
    func loadUserAndAlbums() {
        NetworkManager.shared.fetchUsers()
            .flatMap { users -> AnyPublisher<[Album], Error> in
                self.user = users.randomElement()
                guard let userID = self.user?.id else {
                    return Fail(error: URLError(.badURL))
                        .eraseToAnyPublisher()
                }
                return NetworkManager.shared.fetchAlbums(userID: userID)
            }
            .sink(receiveCompletion: { _ in }, receiveValue: { albums in
                self.albums = albums
            })
            .store(in: &cancellables)
    }
}
