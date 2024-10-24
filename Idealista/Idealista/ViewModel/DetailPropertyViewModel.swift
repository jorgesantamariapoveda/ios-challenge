//
//  DetailPropertyViewModel.swift
//  Idealista
//
//  Created by Jorge on 24/10/24.
//

import Foundation

final class DetailPropertyViewModel: ObservableObject {
    
    private let getDetailPropertyUseCase: GetDetailPropertyUseCase
    
    enum State {
        case idle
        case loading
        case loaded
        case error
    }
    
    @Published var detailPropertyRepresentable: DetailPropertyRepresentable?
    @Published var state: State = .idle
    @Published var errors: String = "" {
        didSet {
            showErrors = !errors.isEmpty
        }
    }
    @Published var showErrors = false
    
    init(
        getDetailPropertyUseCase: GetDetailPropertyUseCase = GetDetailPropertyUseCaseImpl()
    ) {
        self.getDetailPropertyUseCase = getDetailPropertyUseCase
    }
    
    @MainActor
    func getDetailProperty() {
        state = .loading
                
        Task {
            do {
                let detailProperty = try await getDetailPropertyUseCase.execute()
                detailPropertyRepresentable = DetailPropertyRepresentable(domainModel: detailProperty)
                state = .loaded
            } catch {
                state = .error
                errors = error.localizedDescription
            }
        }
    }
}
