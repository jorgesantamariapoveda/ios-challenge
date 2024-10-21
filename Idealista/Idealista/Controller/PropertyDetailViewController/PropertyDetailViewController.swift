//
//  PropertyDetailViewController.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import UIKit

final class PropertyDetailViewController: UIViewController {
    
    private let representable: PropertyRepresentable
    private var getDetailPropertyUseCase: GetDetailPropertyUseCase
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init(
        representable: PropertyRepresentable,
        getDetailPropertyUseCase: GetDetailPropertyUseCase = GetDetailPropertyUseCaseImpl()
    ) {
        self.representable = representable
        self.getDetailPropertyUseCase = getDetailPropertyUseCase
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addConstraints()
        
        setupSubviews()
        
        view.backgroundColor = .white
        title = "Detalle"
        
        loadData()
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupSubviews() {
        for i in 0..<50 {
            let label = UILabel()
            label.text = "Label \(i + 1)"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.backgroundColor = .lightGray
            
            stackView.addArrangedSubview(label)
        }
    }
    
    private func loadData() {
        Task {
            do {
                let value = try await getDetailPropertyUseCase.execute()
                
                print(":: \(value)")
            } catch let error as HTTPClientError {
                print(":: \(error)")
            } catch {
                print(":: \(error.localizedDescription)")
            }
        }
    }
}
