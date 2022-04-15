//
//  GalleryContentVCCell.swift
//  Collection
//
//  Created by Andrey Krivokhizhin on 15.04.2022.
//

import UIKit

class GalleryContentVCCell: UICollectionViewCell {
    let galleryImageView : UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.white.cgColor
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        galleryImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(galleryImageView)
        
        NSLayoutConstraint.activate([
            galleryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            galleryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            galleryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            galleryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
