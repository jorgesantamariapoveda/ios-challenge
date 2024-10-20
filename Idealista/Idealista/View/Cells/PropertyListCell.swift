//
//  PropertyListCell.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import UIKit

final class PropertyListCell: UITableViewCell {
    
    static let reuseId = "PropertyListCell"
    
    private var addressLabelView = AddressLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(addressLabelView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            addressLabelView.topAnchor.constraint(equalTo: contentView.topAnchor),
            addressLabelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            addressLabelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    func set(representable: PropertyRepresentable) {
        addressLabelView.set(text: representable.address)
    }
}
