//
//  BottomButtonView.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import UIKit

final class BottomButtonView: UIView {
    
    enum Constants {
        static let sizeImageButton: CGFloat = 16
    }
    
    private let stackView = HStackView(spacing: 8)
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "phone")
        imageView.tintColor = .idealistaPurple
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: UIFont.preferredFont(forTextStyle: .callout).pointSize)
        label.textColor = .idealistaPurple
        label.isHidden = true
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: Constants.sizeImageButton),
            imageView.widthAnchor.constraint(equalToConstant: Constants.sizeImageButton),
        ])
    }
    
    func set(text: String? = nil, imageSystemName: String) {
        if let text {
            label.text = text
            label.isHidden = false
        }
        imageView.image = UIImage(systemName: imageSystemName)
    }
}
