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
    
    let addressLabelView = AddressDetailLabelView()
    let priceLabelView = BoldLabelView()
    
    let roomsLabelView = FootLabelView()
    let sizeLabelView = FootLabelView()
    let roomsAndSizeStackView = HStackView(
        alignment: .center,
        distribution: .fill,
        spacing: 10
    )
    
    let favoriteButtonView = DetailButtonView()
    let discardButtonView = DetailButtonView()
    let shareButtonView = DetailButtonView()
    let detailButtonsStackView = HStackView(
        alignment: .center,
        distribution: .fillEqually,
        spacing: 10
    )
    
    let titleCommentLabelView = BoldLabelView()
    let descCommentLabelView = CommentDetailLabelView()
    let titleBasicCharacteristicsLabelView = BoldLabelView()
    let descBasicCharacteristicsLabelView = NormalDetailLabelView()
    let energyCertificationLabelView = BoldLabelView()
    
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
        setupViews()
        loadData()
    }
    
    private func setupViews() {
        addressLabelView.set(text: representable.address)
        priceLabelView.set(text: representable.price)
        roomsLabelView.set(text: representable.rooms)
        sizeLabelView.set(text: representable.size)
        favoriteButtonView.set(text: "Guardar", imageSystemName: "heart")
        discardButtonView.set(text: "Descartar", imageSystemName: "trash")
        shareButtonView.set(text: "Compartir", imageSystemName: "square.and.arrow.up")
        
        titleCommentLabelView.set(text: "Comentario del anunciante")
        titleBasicCharacteristicsLabelView.set(text: "Características básicas")
        energyCertificationLabelView.set(text: "Certificado energético")
        
        let basicCharacteristics = """
        · 3 habitaciones
        · 2 baños
        · Terraza
        · Plaza de garaje incluida en el precio
        · Orientación sur
        · Construido en 2008
        · Segunda mano/buen estado
        · Calefacción individual: Bomba de frí/calor
        """
        descBasicCharacteristicsLabelView.set(text: basicCharacteristics)
    }
    
    private func loadData() {
        Task {
            do {
                let detailProperty = try await getDetailPropertyUseCase.execute()
                descCommentLabelView.set(text: detailProperty.description)
            } catch let error as HTTPClientError {
                print("limit:: \(error)")
            } catch {
                print("limit:: \(error)")
            }
        }
    }
}
