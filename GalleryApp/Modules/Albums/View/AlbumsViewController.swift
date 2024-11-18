//
//  AlbumsViewController.swift
//  GalleryApp
//
//  Created by Mohamed Ayman on 18/11/2024.
//

import UIKit

class AlbumsViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var albumsTableView: UITableView!
    
    var albums: Albums = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Profile"
        albumsTableView.delegate = self
        albumsTableView.dataSource = self
    }
}

extension AlbumsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let album = albums[indexPath.row]
        let detailsVC = AlbumDetailsViewController(albumID: album.id, albumTitle: album.title)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension AlbumsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "albumCell")
        let album = albums[indexPath.row]
        cell.textLabel?.text = album.title
        return cell
    }
}
