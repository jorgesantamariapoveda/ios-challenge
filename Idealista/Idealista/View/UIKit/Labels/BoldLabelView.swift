//
//  BoldLabelView.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import UIKit

final class BoldLabelView: UILabel {

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
        font = UIFont.boldSystemFont(ofSize: UIFont.preferredFont(forTextStyle: .title3).pointSize)
        textColor = .black
    }
    
    func set(text: String) {
        self.text = text
    }
}
