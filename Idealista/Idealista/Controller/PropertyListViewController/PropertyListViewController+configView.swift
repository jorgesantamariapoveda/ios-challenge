//
//  PropertyListViewController+configView.swift
//  Idealista
//
//  Created by Jorge on 19/10/24.
//

import UIKit

extension PropertyListViewController {
    func configView() {
        title = "idealista"
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        view.addSubview(titleLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
