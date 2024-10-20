//
//  PropertyDetailViewController.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import UIKit

final class PropertyDetailViewController: UIViewController {
    
    private let property: PropertyRepresentable
    private var getDetailPropertyUseCase: GetDetailPropertyUseCase
    
    init(
        property: PropertyRepresentable,
        getDetailPropertyUseCase: GetDetailPropertyUseCase = GetDetailPropertyUseCaseImpl()
    ) {
        self.property = property
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
        
        view.backgroundColor = .white
        title = "Detalle"
        
        loadData()
    }
    
    private func addSubviews() {
    }
    
    private func addConstraints() {
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
