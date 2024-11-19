//
//  AlbumDetailsViewController.swift
//  GalleryApp
//
//  Created by Mohamed Ayman on 18/11/2024.
//

import UIKit
import Combine

class AlbumDetailsViewController: UIViewController {
    @IBOutlet weak var photosSearchBar: UISearchBar!
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    private let viewModel: AlbumDetailsViewModel
    private var cancellables = Set<AnyCancellable>()
    
    let albumTitle: String
        
    init(albumID: Int, albumTitle: String) {
        self.viewModel = AlbumDetailsViewModel(albumID: albumID)
        self.albumTitle = albumTitle
        super.init(nibName: String(describing: AlbumDetailsViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        viewModel.loadPhotos()
    }
    
    private func setupUI() {
        title = albumTitle
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        photosCollectionView.register(UINib(nibName: Constants.photoCellID, bundle: nil), forCellWithReuseIdentifier: Constants.photoCellID)
    }
    
    private func setupBindings() {
        viewModel.$filteredPhotos
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.photosCollectionView.reloadData()
            }
            .store(in: &cancellables)
    }
}

extension AlbumDetailsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        view.endEditing(true)
        let photoPath = viewModel.filteredPhotos[indexPath.row].url
        let photoViewerVC = PhotoViewerViewController(photoPath: photoPath)
        navigationController?.pushViewController(photoViewerVC, animated: true)
    }
}

extension AlbumDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filteredPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.photoCellID, for: indexPath) as! PhotoCell
        let photoPath = viewModel.filteredPhotos[indexPath.item].url
        cell.config(photoPath: photoPath)
        return cell
    }
}

extension AlbumDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let photosPerRow: CGFloat = 3
        let collectionWidth = collectionView.bounds.width
        let cellWidth = collectionWidth / photosPerRow
        return CGSize(width: cellWidth, height: cellWidth/1.3)
    }
}

extension AlbumDetailsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterPhotos(by: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        view.endEditing(true)
        return true
    }

}
