//
//  AlbumsViewController.swift
//  GalleryApp
//
//  Created by Mohamed Ayman on 18/11/2024.
//

import UIKit
import Combine

class AlbumsViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var albumsTableView: UITableView!
    
    private let viewModel = AlbumsViewModel()
    private var cancellables = Set<AnyCancellable>()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.loadUserAndAlbums()
    }
    
    private func setupUI() {
        title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
        albumsTableView.delegate = self
        albumsTableView.dataSource = self
    }
    
    private func bindViewModel() {
        viewModel.$user
            .receive(on: DispatchQueue.main)
            .sink { [weak self] user in
                guard let user = user else { return }
                self?.updateUserInfo(user: user)
            }
            .store(in: &cancellables)
        
        viewModel.$albums
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.albumsTableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    private func updateUserInfo(user: User) {
        let address = user.address
        let fullAddress = [address.street, address.suite, address.city, address.zipcode].joined(separator: ", ")
        userNameLabel.text = user.name
        addressLabel.text = fullAddress
    }
}

extension AlbumsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let album = viewModel.albums[indexPath.row]
        let detailsVC = AlbumDetailsViewController(albumID: album.id, albumTitle: album.title)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = .label
        header.textLabel?.font = .boldSystemFont(ofSize: 18)
        header.textLabel?.frame = header.bounds.offsetBy(dx: 20, dy: 0)
    }
}

extension AlbumsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "albumCell")
        let album = viewModel.albums[indexPath.row]
        cell.textLabel?.text = album.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My Albums"
    }
}
