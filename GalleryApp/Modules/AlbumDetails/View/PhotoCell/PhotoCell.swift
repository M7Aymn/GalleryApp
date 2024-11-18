//
//  PhotoCell.swift
//  GalleryApp
//
//  Created by Mohamed Ayman on 18/11/2024.
//

import UIKit
import Kingfisher

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(photoPath: String) {
        guard let url = URL(string: photoPath) else { return }
        photoImageView.kf.setImage(with: url)
    }

}
