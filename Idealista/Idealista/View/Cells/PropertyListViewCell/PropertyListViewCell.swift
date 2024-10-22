//
//  PropertyListViewCell.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import UIKit

protocol PropertyListViewCellDelegate: AnyObject {
    func didSelect(representable: PropertyRepresentable)
}

final class PropertyListViewCell: UITableViewCell {
    
    static let reuseId = "PropertyListCell"
    
    weak var delegate: PropertyListViewCellDelegate?
    
    private var representable: PropertyRepresentable?
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.idealistaGray.cgColor
        return view
    }()
    
    // MARK: - Carrusel
    lazy var carruselCollectionView: UICollectionView = {
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
        
        collectionView.delegate = self
        
        return collectionView
    }()
    private var dataSource: UICollectionViewDiffableDataSource<Int, String>!
    
    // MARK: - Content
    let addressLabelView = AddressLabelView()
    
    let priceLabelView = PriceLabelView()
    let isParkingSpaceIncludedInPriceLabelView = FootLabelView()
    
    let roomsLabelView = FootLabelView()
    let sizeLabelView = FootLabelView()
    
    let contentStackView = VStackView(distribution: .fillProportionally, spacing: 8)
    
    // MARK: - HorizontalLine
    let horizontalLineView = HorizontalLineView()
    
    // MARK: - Footer
    let phoneBottomButonView = BottomButtonView()
    let contactBottomButonView = BottomButtonView()
    let bottomLeftButtonsStackView = HStackView(
        alignment: .center,
        distribution: .fillProportionally,
        spacing: 10
    )
    
    let trashBottomButonView = BottomButtonView()
    let favoriteBottomButonView = BottomButtonView()
    let bottomRightButtonsStackView = HStackView(
        alignment: .center,
        distribution: .fillProportionally,
        spacing: 10
    )
    
    let footerStackView = HStackView(
        alignment: .center,
        distribution: .fillProportionally,
        spacing: 10
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        configureViews()
        configureDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, String>(collectionView: carruselCollectionView) {
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
    
    func set(representable: PropertyRepresentable) {
        self.representable = representable
        
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
}

// MARK: - UICollectionViewDelegate
extension PropertyListViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let representable else { return }
        delegate?.didSelect(representable: representable)
    }
}
