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
    @Published var error: String?
    @Published var isLoading = false
    private var cancellables = Set<AnyCancellable>()
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func loadUserAndAlbums() {
        isLoading = true
        networkManager.fetchUsers()
            .flatMap { [weak self] users -> AnyPublisher<[Album], Error> in
                guard let self = self else { return Empty().eraseToAnyPublisher() }
//                self.user = users.randomElement()
                self.user = users.first
                guard let userID = self.user?.id else {
                    return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
                }
                return self.networkManager.fetchAlbums(userID: userID)
            }
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.error = error.localizedDescription
                }
            }, receiveValue: { [weak self] albums in
                self?.albums = albums
            })
            .store(in: &cancellables)
    }
}
