//
//  PropertyDetailViewController+configureViews.swift
//  Idealista
//
//  Created by Jorge on 22/10/24.
//

import UIKit

extension PropertyDetailViewController {
    
    func configureViews() {
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(addressLabelView)
        stackView.addArrangedSubview(priceLabelView)
        
        roomsAndSizeStackView.addArrangedSubview(roomsLabelView)
        roomsAndSizeStackView.addArrangedSubview(sizeLabelView)
        stackView.addArrangedSubview(roomsAndSizeStackView)
        
        detailButtonsStackView.addArrangedSubview(favoriteButtonView)
        detailButtonsStackView.addArrangedSubview(discardButtonView)
        detailButtonsStackView.addArrangedSubview(shareButtonView)
        stackView.addArrangedSubview(detailButtonsStackView)
        
        stackView.addArrangedSubview(titleCommentLabelView)
        stackView.addArrangedSubview(descCommentLabelView)
        
        stackView.addArrangedSubview(titleBasicCharacteristicsLabelView)
        
        stackView.addArrangedSubview(descBasicCharacteristicsLabelView)
        stackView.addArrangedSubview(energyCertificationLabelView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
