//
//  AddressDetailLabelView.swift
//  Idealista
//
//  Created by Jorge on 22/10/24.
//

import UIKit

final class AddressDetailLabelView: UILabel {

    required init() {
        super.init(frame: .zero)
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .left
        font = .preferredFont(forTextStyle: .body)
        textColor = .black
    }
    
    func set(text: String) {
        self.text = text
    }
}
