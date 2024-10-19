//
//  LabelView.swift
//  Idealista
//
//  Created by Jorge on 19/10/24.
//

import UIKit

struct LabelViewRepresentable {
    let title: String
}

final class LabelView: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Property List"
        label.font = .systemFont(ofSize: .init(30))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(representable: LabelViewRepresentable) {
        titleLabel.text = representable.title
    }
}
