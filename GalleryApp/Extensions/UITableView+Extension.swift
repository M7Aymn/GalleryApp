//
//  UITableView+Extension.swift
//  GalleryApp
//
//  Created by Mohamed Ayman on 19/11/2024.
//

import UIKit

extension UITableView {
    func showEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: bounds)
        messageLabel.text = message
        messageLabel.textColor = .secondaryLabel
        messageLabel.textAlignment = .center
        messageLabel.font = .systemFont(ofSize: 16)
        messageLabel.numberOfLines = 0
        backgroundView = messageLabel
        separatorStyle = .none
    }

    func clean() {
        backgroundView = nil
        separatorStyle = .singleLine
    }
}
