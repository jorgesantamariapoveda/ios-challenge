//
//  PropertyListViewCell.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import UIKit

final class PropertyListViewCell: UITableViewCell {
    
    static let reuseId = "PropertyListCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let addressLabelView = AddressLabelView()
    
    private let priceLabelView = PriceLabelView()
    private let isParkingSpaceIncludedInPriceLabelView = FootLabelView()
    private lazy var priceAndParkingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let roomsLabelView = FootLabelView()
    private let sizeLabelView = FootLabelView()
    private lazy var roomsAndSizeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let horizontalLineView = HorizontalLineView()
    
    private let phoneBottomButonView = BottomButonView()
    private let contactBottomButonView = BottomButonView()
    private let spacerView = UIView()
    private lazy var bottomLeftButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let trashBottomButonView = BottomButonView()
    private let favoriteBottomButonView = BottomButonView()
    private lazy var bottomRightButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        containerView.backgroundColor = .clear
        containerView.layer.borderWidth = 0.5
        containerView.layer.borderColor = UIColor.idealistaGray.cgColor
        
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(addressLabelView)
        containerView.addSubview(priceAndParkingStackView)
        containerView.addSubview(roomsAndSizeStackView)
        containerView.addSubview(horizontalLineView)
        containerView.addSubview(bottomLeftButtonsStackView)
        containerView.addSubview(bottomRightButtonsStackView)
        
        priceAndParkingStackView.addArrangedSubview(priceLabelView)
        priceAndParkingStackView.addArrangedSubview(isParkingSpaceIncludedInPriceLabelView)
        
        roomsAndSizeStackView.addArrangedSubview(roomsLabelView)
        roomsAndSizeStackView.addArrangedSubview(sizeLabelView)
        
        bottomLeftButtonsStackView.addArrangedSubview(phoneBottomButonView)
        bottomLeftButtonsStackView.addArrangedSubview(contactBottomButonView)
        bottomLeftButtonsStackView.addArrangedSubview(spacerView)
        
        bottomRightButtonsStackView.addArrangedSubview(trashBottomButonView)
        bottomRightButtonsStackView.addArrangedSubview(favoriteBottomButonView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            addressLabelView.topAnchor.constraint(equalTo: containerView.topAnchor),
            addressLabelView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            addressLabelView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            priceAndParkingStackView.topAnchor.constraint(equalTo: addressLabelView.bottomAnchor),
            priceAndParkingStackView.leadingAnchor.constraint(equalTo: addressLabelView.leadingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            roomsAndSizeStackView.topAnchor.constraint(equalTo: priceAndParkingStackView.bottomAnchor),
            roomsAndSizeStackView.leadingAnchor.constraint(equalTo: addressLabelView.leadingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            horizontalLineView.topAnchor.constraint(equalTo: roomsAndSizeStackView.bottomAnchor, constant: 10),
            horizontalLineView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            horizontalLineView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bottomLeftButtonsStackView.topAnchor.constraint(equalTo: horizontalLineView.bottomAnchor, constant: 10),
            bottomLeftButtonsStackView.leadingAnchor.constraint(equalTo: addressLabelView.leadingAnchor),
            bottomLeftButtonsStackView.trailingAnchor.constraint(greaterThanOrEqualTo: bottomRightButtonsStackView.leadingAnchor),
            bottomLeftButtonsStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            bottomRightButtonsStackView.topAnchor.constraint(equalTo: horizontalLineView.bottomAnchor, constant: 10),
            bottomRightButtonsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            bottomRightButtonsStackView.bottomAnchor.constraint(equalTo: bottomLeftButtonsStackView.bottomAnchor),
        ])
    }
    
    func set(representable: PropertyRepresentable) {
        addressLabelView.set(text: representable.address)
        priceLabelView.set(text: representable.price)
        
        isParkingSpaceIncludedInPriceLabelView.isHidden = !representable.isParkingSpaceIncludedInPrice
        if representable.isParkingSpaceIncludedInPrice {
            isParkingSpaceIncludedInPriceLabelView.set(text: "Garaje incluido")
        }
        
        roomsLabelView.set(text: representable.rooms)
        sizeLabelView.set(text: representable.size)
        
        phoneBottomButonView.set(text: "Llamar", imageSystemName: "phone")
        contactBottomButonView.set(text: "Contactar", imageSystemName: "ellipsis.bubble")
        
        trashBottomButonView.set(imageSystemName: "trash")
        favoriteBottomButonView.set(imageSystemName: "heart")
    }
}
