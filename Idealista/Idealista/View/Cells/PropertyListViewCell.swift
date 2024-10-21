//
//  PropertyListViewCell.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import UIKit

final class PropertyListViewCell: UITableViewCell {
    
    static let reuseId = "PropertyListCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.idealistaGray.cgColor
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        
        let collectionView = UICollectionView(frame: contentView.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.reuseId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    private var dataSource: UICollectionViewDiffableDataSource<Int, String>!
    
    // MARK: - Content
    private let addressLabelView = AddressLabelView()
    
    private let priceLabelView = PriceLabelView()
    private let isParkingSpaceIncludedInPriceLabelView = FootLabelView()
    private lazy var priceAndParkingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let roomsLabelView = FootLabelView()
    private let sizeLabelView = FootLabelView()
    private lazy var roomsAndSizeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    // MARK: - HorizontalLine
    private let horizontalLineView = HorizontalLineView()
    
    // MARK: - Footer
    private let phoneBottomButonView = BottomButonView()
    private let contactBottomButonView = BottomButonView()
    private let spacerView = UIView()
    private lazy var bottomLeftButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let trashBottomButonView = BottomButonView()
    private let favoriteBottomButonView = BottomButonView()
    private lazy var bottomRightButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var footerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        addSubviews()
        addConstraints()
        
        configureDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(collectionView)
        containerView.addSubview(contentStackView)
        containerView.addSubview(horizontalLineView)
        containerView.addSubview(footerStackView)
        
        contentStackView.addArrangedSubview(addressLabelView)
        contentStackView.addArrangedSubview(priceAndParkingStackView)
        contentStackView.addArrangedSubview(roomsAndSizeStackView)
        
        priceAndParkingStackView.addArrangedSubview(priceLabelView)
        priceAndParkingStackView.addArrangedSubview(isParkingSpaceIncludedInPriceLabelView)
        
        roomsAndSizeStackView.addArrangedSubview(roomsLabelView)
        roomsAndSizeStackView.addArrangedSubview(sizeLabelView)
        
        footerStackView.addArrangedSubview(bottomLeftButtonsStackView)
        footerStackView.addArrangedSubview(bottomRightButtonsStackView)
        
        bottomLeftButtonsStackView.addArrangedSubview(phoneBottomButonView)
        bottomLeftButtonsStackView.addArrangedSubview(contactBottomButonView)
        bottomLeftButtonsStackView.addArrangedSubview(spacerView)
        
        bottomRightButtonsStackView.addArrangedSubview(trashBottomButonView)
        bottomRightButtonsStackView.addArrangedSubview(favoriteBottomButonView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: containerView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 200),
        ])

        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8),
            contentStackView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            horizontalLineView.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 8),
            horizontalLineView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            horizontalLineView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            footerStackView.topAnchor.constraint(equalTo: horizontalLineView.bottomAnchor, constant: 8),
            footerStackView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor),
            footerStackView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor),
            footerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    
    func set(representable: PropertyRepresentable) {
        addressLabelView.set(text: representable.address)
        priceLabelView.set(text: representable.price)
        
        isParkingSpaceIncludedInPriceLabelView.isHidden = !representable.isParkingSpaceIncludedInPrice
        if representable.isParkingSpaceIncludedInPrice {
            isParkingSpaceIncludedInPriceLabelView.set(text: "Garaje incluido")
        }
        
        roomsLabelView.set(text: representable.rooms)
        sizeLabelView.set(text: representable.size)
        
        phoneBottomButonView.set(text: "Llamar", imageSystemName: "phone")
        contactBottomButonView.set(text: "Contactar", imageSystemName: "ellipsis.bubble")
        
        trashBottomButonView.set(imageSystemName: "trash")
        favoriteBottomButonView.set(imageSystemName: "heart")
        
        applySnapshot(with: representable.imagesUrl)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, String>(collectionView: collectionView) {
            (collectionView, indexPath, imageUrl) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
            
            if let url = URL(string: imageUrl) {
                cell.set(with: url)
            }
            return cell
        }
    }
    
    private func applySnapshot(with imageUrls: [String]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        snapshot.appendItems(imageUrls)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
