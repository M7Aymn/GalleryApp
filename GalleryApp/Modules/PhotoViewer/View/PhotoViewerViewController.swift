//
//  PhotoViewerViewController.swift
//  GalleryApp
//
//  Created by Mohamed Ayman on 19/11/2024.
//

import UIKit

class PhotoViewerViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    let photoPath: String
    
    init(photoPath: String) {
        self.photoPath = photoPath
        super.init(nibName: String(describing: PhotoViewerViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Zoom"
        scrollView.delegate = self
        photoImageView.setImage(urlString: photoPath)
        setupShareButton()
    }
    
    private func setupShareButton() {
        let icon = UIImage(systemName: Constants.shareImage)
        let shareButton = UIBarButtonItem(image: icon, style: .plain, target: self, action: #selector(shareImage))
        navigationItem.rightBarButtonItem = shareButton
    }
    
    @objc func shareImage() {
        guard let imageToShare = photoImageView.image else { return }
        let activityVC = UIActivityViewController(activityItems: [imageToShare], applicationActivities: nil)
        present(activityVC, animated: true)
    }
}

extension PhotoViewerViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImageView
    }
}
