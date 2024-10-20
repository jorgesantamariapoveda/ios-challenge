//
//  PropertyListView.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import UIKit

protocol PropertyListViewDelegate: AnyObject {
    func didSelect(property: PropertyRepresentable)
}

final class PropertyListView: UIView {
    
    weak var delegate: PropertyListViewDelegate?
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .idealistaPurple
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor.systemBackground
        tableView.register(PropertyListCell.self, forCellReuseIdentifier: PropertyListCell.reuseId)
        tableView.separatorColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var dataSource: UITableViewDiffableDataSource<Int, PropertyRepresentable>!
    private var data: [PropertyRepresentable] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        addConstraints()
        
        activityIndicator.startAnimating()
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(tableView)
        addSubview(activityIndicator)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private func configureTableView() {
        configureDataSource()
        applySnapshot(animatingDifferences: false)
        tableView.delegate = self
    }

    private func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Int, PropertyRepresentable>(tableView: tableView) { (tableView, indexPath, item) -> PropertyListCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: PropertyListCell.reuseId, for: indexPath) as? PropertyListCell
            cell?.set(representable: item)
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
        representable.forEach { data.append($0) }
        applySnapshot()
        activityIndicator.stopAnimating()
    }
}

extension PropertyListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let property = data[indexPath.row]
        delegate?.didSelect(property: property)
    }
}
