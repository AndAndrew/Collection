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
    let data = Data.data
    
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
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionCell
        
        switch data[indexPath.item] {
        case .story(let story):
            let image = story.coverImage
            cell.imageView.image = image
            cell.titleLabel.text = story.title
            cell.contentTypeLabel.text = story.type
        case .gallery(let gallery):
            let image = gallery.coverImage
            cell.imageView.image = image
            cell.titleLabel.text = gallery.title
            cell.contentTypeLabel.text = gallery.type
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let contentVC = ContentViewController()
        contentVC.data = data[indexPath.item]
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
