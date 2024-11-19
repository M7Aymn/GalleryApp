//
//  UIImageView+Extension.swift
//  GalleryApp
//
//  Created by Mohamed Ayman on 19/11/2024.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            self.image = UIImage(named: Constants.loadingFail)
            return
        }
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: Constants.loadingImage),
            options: [.cacheOriginalImage]
        ) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                self.image = UIImage(named: Constants.loadingFail)
            default: break
            }
        }
    }
    
    func clean() {
        self.kf.cancelDownloadTask()
        self.image = nil
    }
}
