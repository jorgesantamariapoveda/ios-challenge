//
//  FootLabelView.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import UIKit

final class FootLabelView: UILabel {

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
        font = .preferredFont(forTextStyle: .footnote)
        textColor = .gray
    }
    
    func set(text: String) {
        self.text = text
    }
}
