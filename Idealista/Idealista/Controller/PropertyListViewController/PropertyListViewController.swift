//
//  PropertyListViewController.swift
//  Idealista
//
//  Created by Jorge on 19/10/24.
//

import UIKit

final class PropertyListViewController: UIViewController {
    
    private var propertyListView = PropertyListView()
    private var getPropertyListUseCase: GetPropertyListUseCase
    
    init(
        propertyListView: PropertyListView = PropertyListView(),
        getPropertyListUseCase: GetPropertyListUseCase = GetPropertyListUseCaseImpl()
    ) {
        self.propertyListView = propertyListView
        self.getPropertyListUseCase = getPropertyListUseCase
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        addSubviews()
        propertyListView.delegate = self
        loadData()
    }
    
    private func addSubviews() {
        self.view = propertyListView
    }
    
    private func loadData() {
        Task {
            do {
                let propertyList = try await getPropertyListUseCase.execute()
                let representable = propertyList.map { PropertyRepresentable(domainModel: $0) }
                propertyListView.set(representable: representable)
            } catch let error as HTTPClientError {
                print("limit:: \(error)")
            } catch {
                print("limit:: \(error)")
            }
        }
    }
}

extension PropertyListViewController: PropertyListViewDelegate {
    func didSelect(representable: PropertyRepresentable) {
        let detailVC = PropertyDetailViewController(representable: representable)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
