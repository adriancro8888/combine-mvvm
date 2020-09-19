//
//  ListView.swift
//  CombineDemo
//
//  Created by Michal Cichecki on 30/06/2019.
//

import UIKit

final class ListView: UIView {
    // TODO: lazy var without block?
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    lazy var searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.backgroundColor = .white
        searchTextField.placeholder = "NBA Player"
        searchTextField.textColor = .darkGray
        return searchTextField
    }()
    
    lazy var activityIndicationView: UIActivityIndicatorView = {
        let activityIndicationView = UIActivityIndicatorView(style: .medium)
        activityIndicationView.color = .white
        activityIndicationView.backgroundColor = .darkGray
        activityIndicationView.layer.cornerRadius = 5.0
        activityIndicationView.hidesWhenStopped = true
        return activityIndicationView
    }()
    
    init() {
        super.init(frame: .zero)
        
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        let subviews = [searchTextField, tableView, activityIndicationView]
        
        subviews.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setUpConstraints() {
        let defaultMargin: CGFloat = 4.0
        
        let searchTextFieldConstraints = [
            searchTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: defaultMargin),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: defaultMargin),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -defaultMargin),
            searchTextField.heightAnchor.constraint(equalToConstant: 30.0)
        ]
        
        let tableViewConstraints = [
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: defaultMargin),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        let activityIndicatorViewConstraints = [
            activityIndicationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicationView.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicationView.heightAnchor.constraint(equalToConstant: 50),
            activityIndicationView.widthAnchor.constraint(equalToConstant: 50.0)
        ]
        
        [searchTextFieldConstraints, tableViewConstraints, activityIndicatorViewConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
    func startLoading() {
        tableView.isUserInteractionEnabled = false
        searchTextField.isUserInteractionEnabled = false
        
        activityIndicationView.isHidden = false
        activityIndicationView.startAnimating()
    }
    
    func finishLoading() {
        tableView.isUserInteractionEnabled = true
        searchTextField.isUserInteractionEnabled = true
        
        activityIndicationView.stopAnimating()
    }
}
