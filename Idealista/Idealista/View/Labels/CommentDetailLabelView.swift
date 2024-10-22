//
//  CommentDetailLabelView.swift
//  Idealista
//
//  Created by Jorge on 23/10/24.
//

import UIKit

final class CommentDetailLabelView: UILabel {

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
        textColor = .black
        numberOfLines = 5
        lineBreakMode = .byTruncatingTail
    }
    
    func set(text: String) {
        self.text = text
    }
}
