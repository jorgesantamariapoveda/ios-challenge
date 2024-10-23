//
//  HorizontalLineView.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import UIKit

final class HorizontalLineView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.backgroundColor = .idealistaGray
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
}
