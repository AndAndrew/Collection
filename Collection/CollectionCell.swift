//
//  CollectionCell.swift
//  Collection
//
//  Created by Andrey Krivokhizhin on 12.04.2022.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    let imageView : UIImageView = {
        let cCellImage = UIImageView()
        
        cCellImage.contentMode = .scaleAspectFill
        cCellImage.clipsToBounds = true
        cCellImage.layer.cornerRadius = 9
        cCellImage.backgroundColor = .gray
        
        return cCellImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 13
        contentView.layer.borderWidth = 1
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
