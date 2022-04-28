//
//  DetailImageViewController.swift
//  Collection
//
//  Created by Andrey Krivokhizhin on 19.04.2022.
//

import UIKit

class DetailImageViewController: UIViewController {
    
    var scrollView = ImageScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
//        scrollView.frame = view.bounds
        setupConstraints()
    }
    
    func setupConstraints() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
