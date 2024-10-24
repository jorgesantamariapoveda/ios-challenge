//
//  PropertyListView.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import UIKit

protocol PropertyListViewDelegate: AnyObject {
    func didSelect(representable: PropertyRepresentable)
}

final class PropertyListView: UIView {
    
    weak var delegate: PropertyListViewDelegate?
    var storage: StorageProtocol?
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .idealistaPurple
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor.systemBackground
        tableView.register(PropertyListViewCell.self, forCellReuseIdentifier: PropertyListViewCell.reuseId)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var dataSource: UITableViewDiffableDataSource<Int, PropertyRepresentable>!
    private var data: [PropertyRepresentable] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        activityIndicator.startAnimating()
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        configureDataSource()
        applySnapshot(animatingDifferences: false)
        tableView.delegate = self
    }

    private func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Int, PropertyRepresentable>(tableView: tableView) { [weak self]
            (tableView, indexPath, item) -> PropertyListViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: PropertyListViewCell.reuseId, for: indexPath) as? PropertyListViewCell
            cell?.set(representable: item)
            cell?.delegate = self
            cell?.storage = self?.storage
            return cell
        }
    }
    
    private func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, PropertyRepresentable>()
        snapshot.appendSections([0])
        snapshot.appendItems(data)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
    func set(representable: [PropertyRepresentable]) {
        data.removeAll()
        data.append(contentsOf: representable)
        applySnapshot()
        
        activityIndicator.stopAnimating()
    }
}

// MARK: - UITableViewDelegate
extension PropertyListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let representable = data[indexPath.row]
        delegate?.didSelect(representable: representable)
    }
}

// MARK: - PropertyListViewCellDelegate
extension PropertyListView: PropertyListViewCellDelegate {
    func didSelect(representable: PropertyRepresentable) {
        delegate?.didSelect(representable: representable)
    }
}
