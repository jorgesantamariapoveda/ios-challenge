//
//  PropertyListViewCell+configureViews.swift
//  Idealista
//
//  Created by Jorge on 21/10/24.
//

import UIKit

extension PropertyListViewCell {
    
    func configureViews() {
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(carruselCollectionView)
        containerView.addSubview(contentStackView)
        containerView.addSubview(priceLabelView)
        containerView.addSubview(isParkingSpaceIncludedInPriceLabelView)
        containerView.addSubview(roomsLabelView)
        containerView.addSubview(sizeLabelView)
        containerView.addSubview(horizontalLineView)
        containerView.addSubview(footerStackView)
        
        contentStackView.addArrangedSubview(addressLabelView)
        
        footerStackView.addArrangedSubview(bottomLeftButtonsStackView)
        footerStackView.addArrangedSubview(bottomRightButtonsStackView)
        
        bottomLeftButtonsStackView.addArrangedSubview(phoneBottomButonView)
        bottomLeftButtonsStackView.addArrangedSubview(contactBottomButonView)
        
        bottomRightButtonsStackView.addArrangedSubview(trashBottomButonView)
        bottomRightButtonsStackView.addArrangedSubview(favoriteBottomButonView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            carruselCollectionView.topAnchor.constraint(equalTo: containerView.topAnchor),
            carruselCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            carruselCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            carruselCollectionView.heightAnchor.constraint(equalToConstant: 200),
        ])

        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: carruselCollectionView.bottomAnchor, constant: 8),
            contentStackView.leadingAnchor.constraint(equalTo: carruselCollectionView.leadingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: carruselCollectionView.trailingAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            priceLabelView.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 8),
            priceLabelView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            isParkingSpaceIncludedInPriceLabelView.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 8),
            isParkingSpaceIncludedInPriceLabelView.leadingAnchor.constraint(equalTo: priceLabelView.trailingAnchor, constant: 8),
            isParkingSpaceIncludedInPriceLabelView.trailingAnchor.constraint(lessThanOrEqualTo: contentStackView.trailingAnchor, constant: -8),
            isParkingSpaceIncludedInPriceLabelView.centerYAnchor.constraint(equalTo: priceLabelView.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            roomsLabelView.topAnchor.constraint(equalTo: priceLabelView.bottomAnchor, constant: 8),
            roomsLabelView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            sizeLabelView.topAnchor.constraint(equalTo: roomsLabelView.topAnchor),
            sizeLabelView.leadingAnchor.constraint(equalTo: roomsLabelView.trailingAnchor, constant: 8),
            sizeLabelView.trailingAnchor.constraint(lessThanOrEqualTo: contentStackView.trailingAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            horizontalLineView.topAnchor.constraint(equalTo: roomsLabelView.bottomAnchor, constant: 8),
            horizontalLineView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            horizontalLineView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            footerStackView.topAnchor.constraint(equalTo: horizontalLineView.bottomAnchor, constant: 8),
            footerStackView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor),
            footerStackView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor),
            footerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
}
