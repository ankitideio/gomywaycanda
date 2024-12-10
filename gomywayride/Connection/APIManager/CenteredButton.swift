//
//  CenteredButton.swift
//  GomywayCanada
//
//  Created by meet sharma on 03/08/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import UIKit

class CenteredButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        centerImageAndTitle()
    }

    private func centerImageAndTitle() {
        guard let imageView = imageView, let titleLabel = titleLabel else { return }
        let imageHalfWidth = imageView.frame.size.width / 2
        let titleHalfWidth = titleLabel.frame.size.width / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -titleHalfWidth, bottom: 0, right: titleHalfWidth)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: imageHalfWidth, bottom: 0, right: -imageHalfWidth)
        contentEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
    }
}
