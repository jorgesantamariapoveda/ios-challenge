//
//  HStackView.swift
//  Idealista
//
//  Created by Jorge on 22/10/24.
//

import UIKit

final class HStackView: UIStackView {
    init(
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        spacing: CGFloat = 0
    ) {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
