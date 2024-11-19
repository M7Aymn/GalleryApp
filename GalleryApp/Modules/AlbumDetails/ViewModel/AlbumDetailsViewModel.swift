//
//  AlbumDetailsViewModel.swift
//  GalleryApp
//
//  Created by Mohamed Ayman on 18/11/2024.
//

import Foundation
import Combine

class AlbumDetailsViewModel {
    @Published var photos: Photos = []
    @Published var filteredPhotos: Photos = []
    @Published var error: String?
    @Published var isLoading = false
    private var cancellables = Set<AnyCancellable>()
    private let networkManager: NetworkManagerProtocol
    let albumID: Int
    
    init(albumID: Int, networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.albumID = albumID
        self.networkManager = networkManager
    }
    
    func loadPhotos() {
        isLoading = true
        networkManager.fetchPhotos(albumID: albumID)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.error = error.localizedDescription
                }
            }, receiveValue: { [weak self] photos in
                self?.photos = photos
                self?.filteredPhotos = photos
            })
            .store(in: &cancellables)
    }
    
    func filterPhotos(by query: String) {
        let query = query.trimmingCharacters(in: .whitespacesAndNewlines)
        if query.isEmpty {
            filteredPhotos = photos
        } else {
            filteredPhotos = photos.filter { $0.title.contains(query.lowercased()) }
        }
    }
}
