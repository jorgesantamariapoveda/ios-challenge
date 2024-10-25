//
//  AddressLabelView.swift
//  Idealista
//
//  Created by Jorge on 19/10/24.
//

import UIKit

final class AddressLabelView: UILabel {

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
        font = .preferredFont(forTextStyle: .callout)
        textColor = .idealistaPurple
    }
    
    func set(text: String) {
        self.text = text
    }
}
