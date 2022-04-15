//
//  ContentViewController.swift
//  Collection
//
//  Created by Andrey Krivokhizhin on 09.04.2022.
//

import UIKit

class ContentViewController: UIViewController {
    
    var collectionView: UICollectionView!
    let headerCellId = "headerCell"
    let storyCellId = "storyCell"
    let galleryCellId = "galleryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .clear
        collectionView.register(HeaderContentVCCell.self, forCellWithReuseIdentifier: headerCellId)
        collectionView.register(StoryContentVCCell.self, forCellWithReuseIdentifier: storyCellId)
        collectionView.register(GalleryContentVCCell.self, forCellWithReuseIdentifier: galleryCellId)
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

extension ContentViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerCellId, for: indexPath) as! HeaderContentVCCell
            cell.imageView.image = UIImage(named: "earth")
            cell.contentTypeLabel.text = "Type"
            cell.layer.cornerRadius = 3
            return cell
        } else {
            switch indexPath.item % 2 != 0 {
            case true:
                let storyCell = collectionView.dequeueReusableCell(withReuseIdentifier: storyCellId, for: indexPath) as! StoryContentVCCell
                storyCell.backgroundColor = .gray
                storyCell.layer.cornerRadius = 3
                return storyCell
            case false:
                let galleryCell = collectionView.dequeueReusableCell(withReuseIdentifier: galleryCellId, for: indexPath) as! GalleryContentVCCell
                galleryCell.galleryImageView.image = UIImage(named: "earth")
                galleryCell.layer.cornerRadius = 3
                return galleryCell
            }
        }
    }
}

extension ContentViewController: UICollectionViewDelegateFlowLayout {
    var edgeInsert: CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 1
        let paddingWidth = edgeInsert * 2 + 20 * (itemsPerRow - 1)
        let itemWidth = (collectionView.frame.width - paddingWidth) / itemsPerRow
        return CGSize(width: itemWidth, height: itemWidth * 1.7)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: edgeInsert, bottom: 0, right: edgeInsert)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
}
