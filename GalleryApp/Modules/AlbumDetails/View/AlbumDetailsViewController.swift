//
//  AlbumDetailsViewController.swift
//  GalleryApp
//
//  Created by Mohamed Ayman on 18/11/2024.
//

import UIKit

class AlbumDetailsViewController: UIViewController {
    @IBOutlet weak var photosSearchBar: UISearchBar!
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    var albumID: Int
    var albumTitle: String
    
    var photos: Photos = []
    
    init(albumID: Int, albumTitle: String) {
        self.albumID = albumID
        self.albumTitle = albumTitle
        super.init(nibName: String(describing: AlbumDetailsViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = albumTitle
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        photosCollectionView.register(UINib(nibName: Constants.photoCellID, bundle: nil), forCellWithReuseIdentifier: Constants.photoCellID)
    }
}

extension AlbumDetailsViewController: UICollectionViewDelegate {
    
}

extension AlbumDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.photoCellID, for: indexPath) as! PhotoCell
        let photoPath = photos[indexPath.row].url
        cell.config(photoPath: photoPath)
        return cell
    }
}

extension AlbumDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let photosPerRow: CGFloat = 3
        let collectionWidth = collectionView.bounds.width
        let cellWidth = collectionWidth / photosPerRow
        return CGSize(width: cellWidth, height: cellWidth/1.4)
    }
}
