//
//  CollectionViewController.swift
//  Collection
//
//  Created by Andrey Krivokhizhin on 07.04.2022.
//

import UIKit

class CollectionViewController: UIViewController {
    
    var collectionView: UICollectionView!
    let cellId = "cell"
    
    override func viewDidLoad() {
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionCell
        cell.titleLabel.text = "Title"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let contentVC = ContentViewController()
        navigationController?.pushViewController(contentVC, animated: true)
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    var edgeInsert: CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let paddingWidth = edgeInsert * 2 + 20 * (itemsPerRow - 1)
        let itemWidth = (collectionView.frame.width - paddingWidth) / itemsPerRow
        return CGSize(width: itemWidth, height: itemWidth * 1.23)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: edgeInsert, bottom: 0, right: edgeInsert)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}
