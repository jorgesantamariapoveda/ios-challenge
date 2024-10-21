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
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let stackView = VStackView()
    
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
        
        view.backgroundColor = .white
        title = "Detalle"
        
        configureViews()
        
        setupSubviews()
        loadData()
    }
    
    //!! Review 🔴
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
                let _ = try await getDetailPropertyUseCase.execute()
            } catch let error as HTTPClientError {
                print("limit:: \(error)")
            } catch {
                print("limit:: \(error)")
            }
        }
    }
}
