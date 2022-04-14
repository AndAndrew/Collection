//
//  CollectionCell.swift
//  Collection
//
//  Created by Andrey Krivokhizhin on 12.04.2022.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    let imageView : GradientImageView = {
        let cCellImage = GradientImageView()
        
        cCellImage.contentMode = .scaleAspectFill
        cCellImage.clipsToBounds = true
        cCellImage.layer.cornerRadius = 9
        cCellImage.backgroundColor = .gray
        
        return cCellImage
    }()
    
    let titleLabel: UILabel = {
        let cCellTitleLabel = UILabel()
        
        cCellTitleLabel.font = UIFont(name: "Rockwell", size: 18)
        cCellTitleLabel.adjustsFontSizeToFitWidth = true
        cCellTitleLabel.minimumScaleFactor = 0.5
        cCellTitleLabel.textAlignment = .left
        cCellTitleLabel.numberOfLines = 1
        cCellTitleLabel.textColor = .white
        
        return cCellTitleLabel
    }()
    
    let contentTypeLabel: UILabel = {
        let cCellTypeLabel = UILabel()
        
        cCellTypeLabel.font = UIFont(name: "Rockwell", size: 14)
        cCellTypeLabel.textColor = UIColor(red: 182 / 255, green: 182 / 255, blue: 182 / 255, alpha: 1)
        cCellTypeLabel.textAlignment = .left
        cCellTypeLabel.adjustsFontSizeToFitWidth = true
        cCellTypeLabel.minimumScaleFactor = 0.5
        cCellTypeLabel.numberOfLines = 1
        
        return cCellTypeLabel
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
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        contentTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contentTypeLabel)
        
        NSLayoutConstraint.activate([
            contentTypeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            contentTypeLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            contentTypeLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10),
            contentTypeLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -13),
            contentTypeLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
