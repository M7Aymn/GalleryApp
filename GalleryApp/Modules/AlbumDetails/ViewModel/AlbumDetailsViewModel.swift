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
    private var cancellables = Set<AnyCancellable>()
    
    let albumID: Int
    
    init(albumID: Int) {
        self.albumID = albumID
    }
    
    func loadPhotos() {
        NetworkManager.shared.fetchPhotos(albumID: albumID)
            .sink(receiveCompletion: { _ in }, receiveValue: { photos in
                self.photos = photos
                self.filteredPhotos = photos
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
