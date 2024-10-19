//
//  PropertyListViewController.swift
//  Idealista
//
//  Created by Jorge on 19/10/24.
//

import UIKit

final class PropertyListViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Property List 2"
        label.font = .systemFont(ofSize: .init(30))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var titleLabelView = LabelView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configView()
    }
}
