//
//  DetailPropertyViewModel.swift
//  Idealista
//
//  Created by Jorge on 24/10/24.
//

import Foundation

final class DetailPropertyViewModel: ObservableObject {
    
    let representable: PropertyRepresentable
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
    
    @Published var isFavourite: Bool = false
    @Published var favouriteDate: String?
    
    init(
        representable: PropertyRepresentable,
        getDetailPropertyUseCase: GetDetailPropertyUseCase = GetDetailPropertyUseCaseImpl()
    ) {
        self.representable = representable
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
    
    @MainActor
    func toggleFavourite() {
        if isFavourite {
            UserDefaults.standard.removeObject(forKey: representable.id)
            isFavourite = false
        } else {
            let currentDate = Date()
            let dateString = currentDate.toString(format: .dd_yy_mm)
            UserDefaults.standard.set(dateString, forKey: representable.id)
            favouriteDate = dateString
            isFavourite = true
        }
    }
    
    @MainActor
    func checkIfFavourite() {
        if let date = UserDefaults.standard.string(forKey: representable.id) {
            favouriteDate = date
            isFavourite = true
        } else {
            isFavourite = false
        }
    }
    
    func getFavouriteDate() -> String? {
        if isFavourite, let favouriteDate {
            return favouriteDate
        }
        return nil
    }
}
