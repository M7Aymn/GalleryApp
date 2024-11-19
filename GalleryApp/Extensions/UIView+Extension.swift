//
//  UIView+Extension.swift
//  GalleryApp
//
//  Created by Mohamed Ayman on 19/11/2024.
//

import UIKit

extension UIView {
    func showLoadingIndicator() {
        if viewWithTag(Constants.indicatorTag) != nil { return }
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.tag = Constants.indicatorTag
        addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        indicator.startAnimating()
    }
    
    func hideLoadingIndicator() {
        if let indicator = viewWithTag(Constants.indicatorTag) as? UIActivityIndicatorView {
            indicator.stopAnimating()
            indicator.removeFromSuperview()
        }
    }
}
