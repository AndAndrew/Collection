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
    var data: ContentType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
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
        switch data {
        case .story(_):
            return 2
        case .gallery(let gallery):
            return gallery.images.count + 1
        case .none:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = data else { return UICollectionViewCell() }
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerCellId, for: indexPath) as! HeaderContentVCCell
            switch data {
            case .story(let story):
                cell.imageView.image = story.coverImage
                cell.contentTypeLabel.text = story.type
            case .gallery(let gallery):
                cell.imageView.image = gallery.coverImage
                cell.contentTypeLabel.text = gallery.type
            }
            return cell
        } else {
            switch data {
            case .story(let story):
                let storyCell = collectionView.dequeueReusableCell(withReuseIdentifier: storyCellId, for: indexPath) as! StoryContentVCCell
                storyCell.textLabel.text = story.text
                return storyCell
            case .gallery(let gallery):
                let galleryCell = collectionView.dequeueReusableCell(withReuseIdentifier: galleryCellId, for: indexPath) as! GalleryContentVCCell
                galleryCell.galleryImageView.image = gallery.images[indexPath.item - 1]
                return galleryCell
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch data {
        case .gallery(let gallery):
            let detailImageVC = DetailImageViewController()
            detailImageVC.scrollView.frame = view.bounds
            detailImageVC.scrollView.set(image: gallery.images[indexPath.item - 1])
            navigationController?.pushViewController(detailImageVC, animated: true)
        case .story(_), .none:
            return
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
        if indexPath.item == 0 {
            return CGSize(width: itemWidth, height: itemWidth * 1.7)
        } else {
            switch data {
            case .gallery(_), .none:
                return CGSize(width: itemWidth, height: itemWidth * 1.7)
            case .story(let story):
                let text = story.text
                let size = NSString(string: text).boundingRect(with: CGSize(width: itemWidth, height: .greatestFiniteMagnitude),
                                                               options: [.usesLineFragmentOrigin, .usesFontLeading],
                                                               attributes: [NSAttributedString.Key.font: UIFont(name: "Rockwell", size: 24) ?? UIFont.systemFont(ofSize: 24)],
                                                               context: nil).size
                return size
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: edgeInsert, bottom: 0, right: edgeInsert)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
}
