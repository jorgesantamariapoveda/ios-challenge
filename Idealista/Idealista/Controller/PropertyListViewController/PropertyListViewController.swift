//
//  PropertyListViewController.swift
//  Idealista
//
//  Created by Jorge on 19/10/24.
//

import UIKit
import SwiftUI

final class PropertyListViewController: UIViewController {
    
    private var propertyListView = PropertyListView()
    
    private var getPropertyListUseCase: GetPropertyListUseCase
    
    init(
        getPropertyListUseCase: GetPropertyListUseCase = GetPropertyListUseCaseImpl()
    ) {
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

// MARK: - PropertyListViewDelegate
extension PropertyListViewController: PropertyListViewDelegate {
    func didSelect(representable: PropertyRepresentable) {
        let swiftUIView = PropertyDetailView(representable: representable)
        let hostingController = UIHostingController(rootView: swiftUIView)
        navigationController?.pushViewController(hostingController, animated: true)
    }
}
