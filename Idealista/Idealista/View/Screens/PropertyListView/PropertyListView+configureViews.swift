//
//  PropertyListView+configureViews.swift
//  Idealista
//
//  Created by Jorge on 21/10/24.
//

import UIKit

extension PropertyListView {
    
    func configureViews() {
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        addSubview(tableView)
        addSubview(activityIndicator)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
