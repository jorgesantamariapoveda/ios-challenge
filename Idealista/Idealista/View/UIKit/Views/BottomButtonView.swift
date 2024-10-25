//
//  BottomButtonView.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import UIKit

protocol BottomButtonViewDelegate: AnyObject {
    func didButtonTapped()
}

final class BottomButtonView: UIView {
    
    weak var delegate: BottomButtonViewDelegate?
    
    enum Constants {
        static let sizeImageButton: CGFloat = 16
    }
    
    private let stackView = HStackView(spacing: 8)
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .idealistaPurple
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
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
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(label)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: Constants.sizeImageButton),
            button.widthAnchor.constraint(equalToConstant: Constants.sizeImageButton),
        ])
    }
    
    @objc private func buttonTapped() {
        delegate?.didButtonTapped()
    }
    
    func set(text: String? = nil, imageSystemName: String) {
        if let text {
            label.text = text
            label.isHidden = false
        }
        
        button.setImage(UIImage(systemName: imageSystemName), for: .normal)
    }
}
